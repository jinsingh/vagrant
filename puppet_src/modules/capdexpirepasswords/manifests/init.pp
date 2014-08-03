# class capdexpirepasswords: expires internal user auth passwords using a cronned jar

class capdexpirepasswords {

  include capdexpirepasswords::config, capdexpirepasswords::package

  Class['capdexpirepasswords::package'] -> Class['capdexpirepasswords::config']

}
