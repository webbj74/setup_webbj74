class setup_webbj74::vagrants {
  class { 'virtualbox':
    version => '4.3.26',
    patch_level => '98988'
  }
  class { 'vagrant': }
}

