# Installs my favorite brews
#   include setup_webbj74::brews
class setup_webbj74::brews {
  include homebrew

  $webbj74_brews = [
    'source-highlight',
    'the_silver_searcher',
    'terminal-notifier',
  ]

  package { $webbj74_brews:
    ensure => 'installed',
  }

  # irssi needs options
  package { 'irssi':
    ensure          => present,
    install_options => [
      '--with-perl=yes',
      '--with-proxy'
    ],
    provider        => 'homebrew'
  }

  # less highlighting
  boxen::env_script { 'less_syntax_highlighting.sh':
    source   => 'puppet:///modules/setup_webbj74/bin/less_syntax_highlighting.sh',
    priority => 'low',
    require  => Package['source-highlight'],
  }
}
