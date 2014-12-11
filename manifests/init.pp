# Preferences for webbj74
# See also experimental.pp
class setup_webbj74 {
  include setup_webbj74::apps
  include setup_webbj74::fonts
  include setup_webbj74::gitconfig
  include setup_webbj74::osx
}

