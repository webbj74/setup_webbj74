# D8 Learning Initiative
class setup_webbj74::projects::companyofstars {

  $site = 'companyofstars'
  php::project { $site:
    dir    => "${boxen::config::srcdir}/${site}",
    source => 'git@github.com:webbj74/companyofstars.git',
    mysql  => true,
    nginx  => 'setup_webbj74/nginx/nginx-ac.conf.erb',
    php    => '5.5.25',
  }

  host {"${site}.dev":
    ensure => 'present',
    ip     => '127.0.0.1',
  }

  notify { " ${site} prepared for install http://${site}.dev ":
    require => Php::Project[$site],
  }

}
