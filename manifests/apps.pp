# Install apps
#   include setup_webbj74::apps
class setup_webbj74::apps {
  package { 'Things':
    provider => 'compressed_app',
    source   => 'http://culturedcode.cachefly.net/things/Things_2.5.1.zip',
  }
  #package { 'LittleSnitch':
  #  provider => 'appdmg',
  #  source   => 'http://www.obdev.at/downloads/littlesnitch/LittleSnitch-3.5.dmg',
  #}
}
