# Installs some extra php stuff
#   include setup_webbj74::php
class setup_webbj74::php {

  php::extension::xdebug { 'xdebug for 5.5.25':
    php     => '5.5.25',
    version => '2.2.5',
  }

  exec {'/opt/boxen/phpenv/bin/composer global require "phpmd/phpmd:@stable"':
    creates => "/Users/${::boxen_user}/.composer/vendor/bin/phpmd",
    require => Class["php::composer"],
  }
}
