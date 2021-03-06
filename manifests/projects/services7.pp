#
# rsync -av suponcall:/mnt/gfs/briareus/sites/default/files/ ~/src/suponcall/docroot/sites/default/files
# scp suponcall:/mnt/gfs/briareus/backups/prod-briareus-briareus-`date +%F`.sql.gz ~/src/suponcall/
# gunzip ~/src/suponcall/prod-briareus-briareus-`date +%F`.sql.gz
# mysql --database=suponcall_development --host=localhost --user=root -p < ~/src/suponcall/prod-briareus-briareus-`date +%F`.sql
# 
# See: docroot/sites/default/dev/boxen-settings.inc
# Create: docroot/sites/default/dev/boxen-settings-${USER}.inc
class setup_webbj74::projects::services7 {

  $site = 'services7'
  php::project { "${site}":
    dir           => "${boxen::config::srcdir}/${site}",
    source        => 'services7@svn-5042.devcloud.hosting.acquia.com:services7.git',
    mysql         => true,
    nginx         => 'projects/nginx/nginx-ac.conf.erb',
    php           => '5.5.13',
  }

  host {"${site}.dev":
    ensure => "present",
    ip => '127.0.0.1',
  }

  notify { " $site prepared for install http://$site.dev ":
    require => Php::Project["${site}"],
  }

}
