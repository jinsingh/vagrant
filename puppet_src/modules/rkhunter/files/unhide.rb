#!/usr/bin/ruby -w

# Try to find running processes using different methods, and report
# processes found through some means but not through others.
#
# Exit code 2 means something fishy was detected.
#
# Exit code 1 means something went wrong.

# Copyright 2009 by Johan Walles, johan.walles@gmail.com
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'set'
require 'dl/import'
require 'dl/struct'

# Support for libc functions not covered by the standard Ruby
# libraries
module LibC
  if RUBY_VERSION =~ /^1\.8/
    extend DL::Importable
  else
    extend DL::Importer
  end
  dlload "libc.so.6"

  # PID scanning functions
  extern "int getsid(int)"
  extern "int sched_getscheduler(int)"
  extern "int sched_getparam(int, void*)"
  extern "int sched_rr_get_interval(int, void*)"
  extern "int sched_getaffinity(int, int, void*)"
  extern "int readlink(char *, char *, int)"
  extern "int kill(int, int)"

  # We want to ask sysinfo about the number of active PIDs.  This
  # result struct has been taken from the sysinfo(2) Linux man page.
  SysInfoData = struct [
     "long uptime",
     "long loads[3]",
     "long totalram",
     "long freeram",
     "long sharedram",
     "long bufferram",
     "long totalswap",
     "long freeswap",
     "short procs",
     "long padding[42]"
   ]
   extern "int sysinfo(void *)"
end

# A piece of scratch memory where system calls can fill in
# information.  What's written here is not interesting, it's just that
# some of the PID scanning functions need a memory area to write into.
scratch = "\0" * 1024

# Make sure our scratch buffer is large enough for sched_getaffinity()
while LibC.sched_getaffinity(0, scratch.length, scratch) == -1
  scratch = "\0" * (scratch.length * 2)
end

$proc_parent_pids = nil
$proc_tasks = nil
$ps_pids = nil
$proc_readdir_pids = nil
def setup
  # List all parent processes pointed out by anybody in /proc
  $proc_parent_pids = Set.new
  proc_dir = Dir.new("/proc")
  proc_dir.each do |proc_entry|
    next unless File.directory?("/proc/" + proc_entry)
    next unless proc_entry =~ /^[0-9]+$/
    status_file = File.new("/proc/#{proc_entry}/status")
    begin
      status_file.each_line do |line|
        line.chomp!
        next unless line =~ /^ppid:\s+([0-9]+)$/i
        ppid = $1.to_i
        $proc_parent_pids << ppid
        break
      end
    ensure
      status_file.close
    end
  end
  proc_dir.close

  # List all thread pids in /proc
  $proc_tasks = {}
  proc_dir = Dir.new("/proc")
  proc_dir.each do |proc_entry|
    next unless File.directory?("/proc/" + proc_entry)
    next unless proc_entry =~ /^[0-9]+$/
    task_dir = Dir.new("/proc/#{proc_entry}/task")
    begin
      task_dir.each do |task_pid|
        next unless task_pid =~ /^[0-9]+$/

        # "true" means we *have* an executable
        exe = true
        begin
          # Store the *name* of the executable
          exe = File.readlink("/proc/#{proc_entry}/task/#{task_pid}/exe")
        rescue Errno::EACCES, Errno::ENOENT
          # This block intentionally left blank
        end
        $proc_tasks[task_pid.to_i] = exe
      end
    ensure
      task_dir.close
    end
  end
  proc_dir.close

  # List all PIDs displayed by ps
  $ps_pids = {}
  $ps_pids.default = false
  ps_stdout = IO.popen("ps axHo lwp,cmd", "r")
  ps_pid = ps_stdout.pid
  ps_stdout.each_line do |ps_line|
    ps_line.chomp!
    next unless ps_line =~ /^\s*([0-9]+)\s+([^ ]+).*$/
    pid = $1.to_i
    exe = $2
    $ps_pids[pid] = exe
  end
  ps_stdout.close
  # Remove the ps process itself from our pid list
  $ps_pids.delete ps_pid

  # List all pids found by readdir on /proc
  $proc_readdir_pids = Set.new
  Dir.open("/proc").each do |dir|
    next unless dir =~ /^[0-9]+$/
    $proc_readdir_pids << dir.to_i
  end
end

# Return errno after last library call
def get_errno()
  return DL.respond_to?("last_error") ? DL::last_error : Fiddle::last_error
end

# This array contains named PID detectors. Given a PID to examine they
# can say:
# * true (it exists)
# * "some string" (it exists, and here is its name)
# * false (it doesn't exist)
# * nil (don't know)
$pid_detectors = [
                 ["ps", proc { |pid|
                    # Does "ps" list this pid?
                    $ps_pids[pid]
                  }],

                 ["/proc naive", lambda { |pid|
                    # Is there a /proc entry for this pid?
                    File.directory?("/proc/#{pid}")
                  }],

                 ["/proc readdir", lambda { |pid|
                    # Did we find this pid when listing the contents of /proc?
                    if $proc_readdir_pids.include?(pid)
                      true
                    else
                      nil
                    end
                  }],

                 ["/proc opendir", lambda { |pid|
                    # Is there a /proc entry for this pid that we can do opendir() on?
                    begin
                      Dir.open("/proc/#{pid}")
                      true
                    rescue Errno::ENOENT
                      false
                    end
                  }],

                 ["/proc/<pid>/status", lambda { |pid|
                    # Parse the process name out of /proc/1234/status
                    begin
                      process_name = true
                      File.open("/proc/#{pid}/status").each do |line|
                        next unless line =~ /Name:[\t ]+(.*)$/
                        process_name = $1
                        break
                      end
                      process_name
                    rescue Errno::ENOENT
                      false
                    end
                  }],
                  
                 ["/proc readlink", lambda { |pid|
                    # Read the /proc/1234/exe entry for this pid
                    begin
                      File.readlink("/proc/#{pid}/exe")
                    rescue Errno::EACCES
                      "<run unhide.rb as root to identify exe>"
                    rescue Errno::ENOENT
                      # Some kernel processes have unreadable symlinks in /proc/1234/pid, and
                      # we can't tell "unreadable symlink" apart from "process doesn't exist"
                      nil
                    end
                  }],

                  ["/proc libc-readlink", lambda { |pid|
                     # Is this process visible by the readlink libc function?
                     # The result of this can differ from File.readlink() if
                     # somebody has preloaded a library that overrides certain
                     # libc functions as described here:
                     # http://sourceforge.net/mailarchive/message.php?msg_id=28258660
                     length = LibC.readlink("/proc/#{pid}/exe", scratch, scratch.length)
                     if length >= 0
                       scratch[0..(length - 1)]
                     else
                       case get_errno()
                         when 2 # ENOENT
                           # Some kernel processes have unreadable symlinks in /proc/1234/pid, and
                           # we can't tell "unreadable symlink" apart from "process doesn't exist"
                           nil
                         when 13 # EACCES
                           "<run unhide.rb as root to identify exe>"
                       else
                         raise "Unknown errno #{errno}"
                       end
                     end
                   }],

                 ["/proc tasks", proc { |pid|
                    # Is there a /proc/1234/tasks/pid directory for
                    # this pid?
                    $proc_tasks[pid]
                  }],

                 ["/proc parent", proc { |pid|
                    # Does any /proc entry point this pid out as a
                    # parent pid?
                    if $proc_parent_pids.include? pid
                      true
                    else
                      nil
                    end
                  }],

                 ["/proc chdir", proc { |pid|
                    # Can we chdir into /proc/<pid>?
                    begin
                      Dir::chdir "/proc/#{pid}"
                      true
                    rescue Errno::ENOENT
                      false
                    end
                  }],

                 ["getsid()", proc { |pid|
                    LibC.getsid(pid) != -1
                  }],

                 ["getpgid()", proc { |pid|
                    exists = true
                    begin
                      Process.getpgid(pid)
                    rescue
                      exists = false
                    end
                    exists
                  }],

                 ["getpriority()", proc { |pid|
                    exists = true
                    begin
                      Process.getpriority(Process::PRIO_PROCESS, pid)
                    rescue
                      exists = false
                    end
                    exists
                  }],

                 ["sched_getparam()", proc { |pid|
                    LibC.sched_getparam(pid, scratch) != -1
                  }],

                 ["sched_getaffinity()", proc { |pid|
                    LibC.sched_getaffinity(pid, scratch.length, scratch) != -1
                  }],

                 ["sched_getscheduler()", proc { |pid|
                    LibC.sched_getscheduler(pid) != -1
                  }],

                 ["kill(pid, 0)", proc { |pid|
                    if LibC.kill(pid, 0) == 0
                      true
                    else
                      case get_errno
                      when 1 # EPERM
                        true
                      when 3 # ESRCH
                        false
                      else
                        raise "Unknown errno #{errno}"
                      end
                    end
                  }]
                ]

found_something = false

# Scan PIDs and report those found by some means but not others
#
# Returns a map of pids->warning strings
def get_suspicious_pids(pids_to_scan = nil)
  if pids_to_scan == nil
    pid_max = File.new("/proc/sys/kernel/pid_max").gets.to_i
    pids_to_scan = (1..pid_max)
  end

  return_me = Hash.new
  pids_to_scan.each do |pid|
    pid_exists = {}
    $pid_detectors.each do |pid_detector|
      detector_name = pid_detector[0]
      detector_proc = pid_detector[1]

      pid_exists[detector_name] = detector_proc.call(pid)
    end

    # Is there consensus about the existence of this process?
    suspicious = false
    existence_consensus = nil
    pid_exists.values.each do |existence|
      # Always over-write "don't know"
      existence_consensus = existence if existence_consensus == nil

      # This one is undecisive, skip it
      next if existence == nil

      # Does the result of this test match the consensus?
      if existence_consensus == false
        unless existence == false
          suspicious = true
          break
        end
      else
        # Anything but "false" is considered to be true, can be a string
        # with a process name in it for example
        if existence == false
          suspicious = true
          break
        end
      end
    end

    if suspicious
      # Put output in a string and add it to the return result
      message = "Suspicious PID #{pid}:"
      $pid_detectors.each do |detector|
        detector_name = detector[0]
        detector_result = pid_exists[detector_name]
        next if detector_result == nil

        description = ""
        description =
          " (\"#{detector_result}\")" if detector_result.class == String
        message +=
          sprintf("\n  %s: %s%s",
                  detector_result ? "     Seen by" : "Invisible to",
                  detector_name,
                  description)
      end
      return_me[pid] = message
    end
  end

  return return_me
end


##
## Main program starts here
##


puts "Scanning for hidden processes..."

setup

# Check for unknown preloads.  This will name the Jynx LD Poisoning
# library.
suspicious_mappings = Set.new
File.open("/proc/self/maps").each do |line|
  next unless line =~ /[^\/]*(\/.*)$/
  mapped_file = $1
  next if File::exist? mapped_file
  suspicious_mappings << mapped_file
end
unless suspicious_mappings.empty?
  found_something = true
  STDERR.puts "I have a mapped file (or more) that I can't access!  Results may be wrong."
  STDERR.puts "Check /etc/ld.so.preload or dynamic linker for compromise:"
  suspicious_mappings.each do |mapping|
    STDERR.puts "  #{mapping}"
  end
end

# Verify PID count between ps and sysinfo()
sysinfo = LibC::SysInfoData.malloc
if LibC.sysinfo(sysinfo) == -1
  STDERR.puts "Error: failed calling sysinfo()"
  exit 1
end
if sysinfo.procs != $ps_pids.size
  $stderr.puts "ps and sysinfo() process count mismatch:"
  $stderr.puts "  ps: #{$ps_pids.size} processes"
  $stderr.puts "  sysinfo(): #{sysinfo.procs} processes"
  found_something = true
end

suspicious_pids = get_suspicious_pids

unless suspicious_pids.empty?
  # Filter out false positives by testing all positives again.  False
  # positives occur when we race with processes starting up or
  # shutting down.
  setup
  still_suspicious_pids = get_suspicious_pids(suspicious_pids.keys)

  still_suspicious_pids.keys.sort.each do |still_suspicious_pid|
    warning_text = suspicious_pids[still_suspicious_pid]
    next unless warning_text

    found_something = true
    $stderr.puts warning_text
  end
end

if found_something
  exit 2
else
  puts "No hidden processes found!"
end
