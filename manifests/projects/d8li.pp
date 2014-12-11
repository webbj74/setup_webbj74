# D8 Learning Initiative
class setup_webbj74::projects::d8li {

  $site = 'd8li'
  php::project { $site:
    dir           => "${boxen::config::srcdir}/${site}",
    source        => 'git@github.com:drupal/drupal --branch=8.0.0-beta3',
    mysql         => true,
    nginx         => 'projects/nginx/nginx-non-ac.conf.erb',
    php           => '5.4.17',
  }

  host {"${site}.dev":
    ensure => 'present',
    ip     => '127.0.0.1',
  }

  notify { " ${site} prepared for install http://${site}.dev ":
    require => Php::Project[$site],
  }

}
