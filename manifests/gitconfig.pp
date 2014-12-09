# Configures git
#  include setup_webbj74::gitconfig
class setup_webbj74::gitconfig {
  git::config::global {
    'core.pager':    value => '/usr/bin/less -+$LESS -FRX';
  }
}
