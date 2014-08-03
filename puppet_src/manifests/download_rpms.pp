node default {
    Exec {
      path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      logoutput=>on_failure,
    }

    file {'/tmp':
      ensure => directory,
    }

    exec { 'download-capdsitiserviceintegration-file':
      command => 'curl -o capdsitiserviceintegration.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_SitiServiceInterfacesRpm/.lastSuccessful/,
      unzip -o capdsitiserviceintegration.zip
      rm -rf capdsitiserviceintegration.zip',
      creates => '/tmp/capdsitiserviceintegration_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdservices-file':
      command => 'curl -o capdservices.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_ServicesRpm/.lastSuccessful/,
      unzip -o capdservices.zip
      rm -rf capdservices.zip
      mv capdservices_*.rpm capdservices_latest.rpm
      ',
      creates => '/tmp/capdservices_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdmatching-file':
      command => 'curl -o capdmatching.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_MatchingServiceRpm/.lastSuccessful/,
      unzip -o capdmatching.zip
      rm -rf capdmatching.zip
      mv capdmatching_*.rpm capdmatching_latest.rpm
      ',
      creates => '/tmp/capdmatching_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdmatchingadapter-file':
      command => 'curl -o capdmatchingadapter.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_MatchingServiceAdapterRPM/.lastSuccessful/,
      unzip -o capdmatchingadapter.zip
      rm -rf capdmatchingadapter.zip
      mv capdmatchingadapter_*.rpm capdmatchingadapter_latest.rpm
      ',
      creates => '/tmp/capdmatchingadapter_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdplayauth-file':
      command => 'curl -o capdplayauth.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_PlayAuthRpm/.lastSuccessful/,
      unzip -o capdplayauth.zip
      rm -rf capdplayauth.zip
      mv capdplayauth_*.rpm capdplayauth_latest.rpm
      ',
      creates => '/tmp/capdplayauth_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdtasks-file':
      command => 'curl -o capdtasks.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_TasksRpm/.lastSuccessful/,
      unzip -o capdtasks.zip
      rm -rf capdtasks.zip
      mv capdtasks_*.rpm capdtasks_latest.rpm
      ',
      creates => '/tmp/capdtasks_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdauth-file':
      command => 'curl -o capdauth.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_AuthRpm/.lastSuccessful/,
      unzip -o capdauth.zip
      rm -rf capdauth.zip
      mv capdauth_*.rpm capdauth_latest.rpm
      ',
      creates => '/tmp/capdauth_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdsendmail-file':
      command => 'curl -o capdsendmail.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_SendmailServiceRpm/.lastSuccessful/,
      unzip -o capdsendmail.zip
      rm -rf capdsendmail.zip
      mv capdsendmail_*.rpm capdsendmail_latest.rpm
      ',
      creates => '/tmp/capdsendmail_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdinternalload-file':
      command => 'curl -o capdinternalload.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_InternalDataLoadRpm/.lastSuccessful/,
      unzip -o capdinternalload.zip
      rm -rf capdinternalload.zip
      mv capdinternalload_*.rpm capdinternalload_latest.rpm
      ',
      creates => '/tmp/capdinternalload_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capddata-file':
      command => 'curl -o capddata.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_CapddataRpm/.lastSuccessful/,
      unzip -o capddata.zip
      rm -rf capddata.zip
      mv capddata_*.rpm capddata_latest.rpm
      ',
      creates => '/tmp/capddata_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdidaprivatebetatokensbatch-file':
      command => 'curl -o capdidaprivatebetatokensbatch.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_IdaPrivateTokensBetaRpm/.lastSuccessful/,
      unzip -o capdidaprivatebetatokensbatch.zip
      rm -rf capdidaprivatebetatokensbatch.zip
      mv capdidaprivatebetatokensbatch_*.rpm capdidaprivatebetatokensbatch_latest.rpm
      ',
      creates => '/tmp/capdidaprivatebetatokensbatch_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdmdmload-file':
      command => 'curl -o capdmdmload.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_MdmDataLoadRpm/.lastSuccessful/,
      unzip -o capdmdmload.zip
      rm -rf capdmdmload.zip
      mv capdmdmload_*.rpm capdmdmload_latest.rpm',
      creates => '/tmp/capdmdmload_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-ssui-file':
      command => 'curl -o capdssui.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_SelfServiceUiRpm/.lastSuccessful/,
      unzip -o capdssui.zip
      rm -rf capdssui.zip
      mv capdssui_*.rpm capdssui_latest.rpm',
      creates => '/tmp/capdssui_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
    ->
    exec { 'download-capdinternaluseractivation-file':
      command => 'curl -o capdinternaluseractivation.zip https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/Capd_ArtifactGeneration_InternalUserActivationBuildRpm/.lastSuccessful/,
      unzip -o capdinternaluseractivation.zip
      rm -rf capdinternaluseractivation.zip
      mv capdinternaluseractivation_*.rpm capdinternaluseractivation_latest.rpm',
      creates => '/tmp/capdinternaluseractivation_latest.rpm',
      timeout => 0,
      cwd     => '/tmp/',
    }
}