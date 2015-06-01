# Preferences for webbj74
# See also experimental.pp
class setup_webbj74 {
  include setup_webbj74::apps
  include setup_webbj74::fonts
  include setup_webbj74::gitconfig
  include setup_webbj74::osx
  include setup_webbj74::projects::error # troublemaker module sandbox
  include setup_webbj74::vagrants

  boxen::env_script { 'grep_options':
    source  => 'puppet:///modules/setup_webbj74/dotfiles/grep-options.sh',
    priority => 'low',
  }
}

