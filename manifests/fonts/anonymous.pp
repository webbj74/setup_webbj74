# Defines the installation of "Anonymous Pro" monospace fonts
#
# To install all fonts:
#   include setup_webbj74::fonts::anonymous:all
#
# To install a single font
#   include setup_webbj74::fonts::anonymous::regular
#   include setup_webbj74::fonts::anonymous::bold
#   include setup_webbj74::fonts::anonymous::italic
#   include setup_webbj74::fonts::anonymous::bold_italic
#
define setup_webbj74::fonts::anonymous ($filename = $title) {
  file { "/Users/${::luser}/Library/Fonts/${filename}":
    ensure => 'present',
    source => "puppet:///modules/setup_webbj74/fonts/AnonymousPro/${filename}",
  }
}
