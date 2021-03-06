# == Class: upstart
#
# Full description of class upstart here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { upstart:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class upstart {


}

define upstart::service(
  $method,  # 'override' or 'initctl'
  $autostart  = true,
){
  $service = $title
  if $method == 'override' {
    file{"/etc/init/${service}.override":
      ensure  =>  present,
      mode    =>  '0644',
      owner   =>  'root',
      group   =>  'root',
    }
    file_line{"disable_${service}":
      path    =>  "/etc/init/${service}.override",  
      line    =>  'manual',
      ensure  =>  $autostart ? {
                    true  =>  'absent',
                    false =>  'present',
                  }
    }
  }


}

