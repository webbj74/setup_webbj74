#
#  OSX settings
#
class setup_webbj74::osx {
  include osx::dock::autohide
  include osx::finder::show_hidden_files
  include osx::global::disable_autocorrect
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  osx::recovery_message { 'If you find this Mac, please call or text Jonathan +1-978-566-9322': }

  osx::dock::hot_corner { 'Bottom Right':
    action => 'Start Screen Saver'
  }
}
