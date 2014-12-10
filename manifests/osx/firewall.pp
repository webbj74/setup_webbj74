#
#  OSX pf firewall rules
#  References:
#  * https://gist.github.com/scy/8122924
#
class setup_webbj74::osx::firewall(
  $ensure = present,
) {

  case $ensure {
    present: {
      file { '/etc/pf.webbj74.conf':
        ensure => 'present',
        notify => Service['com.apple.pfctl'],
        source => 'puppet:///modules/setup_webbj74/firewall/pf.webbj74.conf'
      }

      file { '/etc/pf.anchors/name.webbj74':
        ensure => 'present',
        notify => Service['com.apple.pfctl'],
        source => 'puppet:///modules/setup_webbj74/firewall/pf.webbj74.anchor.conf',
      }

      file { '/Library/LaunchDaemons/name.webbj74.pf.plist':
        ensure => 'present',
        group  => 'wheel',
        notify => Service['com.apple.pfctl'],
        owner  => 'root',
        source => 'puppet:///modules/setup_webbj74/firewall/name.webbj74.pf.plist',
      }

      service { 'com.apple.pfctl': }
    }

    absent, default: {
      file { [
        '/etc/pf.webbj74.conf',
        '/etc/pf.anchors/name.webbj74',
        '/Library/LaunchDaemons/name.webbj74.pf.plist',
      ]:
        ensure => absent,
        notify => Service['com.apple.pfctl'],
      }

      service { 'com.apple.pfctl': }
    }
  }
}
