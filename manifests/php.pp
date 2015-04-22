# Installs some extra php stuff
#   include setup_webbj74::php
class setup_webbj74::php {
  # 5.2 Doesn't seem to work with latest update to puppet-php
  # php::version { '5.2.17': }

  php::extension::xdebug { 'xdebug for 5.3.27':
    php     => '5.3.27',
  }

  php::extension::memcache { 'memcache for 5.4.17':
    php     => '5.4.17',
  }

  php::extension::xdebug { 'xdebug for 5.4.17':
    php     => '5.4.17',
  }

  php::extension::xdebug { 'xdebug for 5.5.0':
    php     => '5.5.0',
    version => '2.2.5',
  }

  php::extension::xdebug { 'xdebug for 5.5.13':
    php     => '5.5.13',
    version => '2.2.5',
  }

  exec {'/opt/boxen/phpenv/bin/composer global require "phpmd/phpmd:@stable"':
    creates => "/Users/${::boxen_user}/.composer/vendor/bin/phpmd",
    require => Class["php::composer"],
  }
}
