# Preferences for webbj74
# See also experimental.pp
class setup_webbj74 {
  include setup_webbj74::apps
  include setup_webbj74::fonts
  include setup_webbj74::gitconfig
  include setup_webbj74::osx
  include setup_webbj74::projects::error # troublemaker module sandbox
  include setup_webbj74::vagrants
  include setup_webbj74::projects::services7 # TAC-2906

  boxen::env_script { 'phpstorm_xdebug':
    source  => 'puppet:///modules/setup_webbj74/dotfiles/phpstorm-xdebug.sh',
    priority => 'low',
  }
  boxen::env_script { 'grep_options':
    source  => 'puppet:///modules/setup_webbj74/dotfiles/grep-options.sh',
    priority => 'low',
  }
}

