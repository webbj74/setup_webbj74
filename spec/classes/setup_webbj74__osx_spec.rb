require 'spec_helper'

describe 'setup_webbj74::osx' do
  let(:facts) { default_test_facts }
  it do
    should include_class('setup_webbj74::osx')
    should contain_boxen__osx_defaults('Automatically hide the dock')
    should contain_boxen__osx_defaults('Show Hidden Files')
    should contain_boxen__osx_defaults('Disable autocorrect')
    should contain_boxen__osx_defaults('Expand save panel by default')
    should contain_boxen__osx_defaults('Tap-To-Click Mouse')
    should contain_boxen__osx_defaults('Set OS X Recovery Message')
    should contain_boxen__osx_defaults('Hot Corners Bottom Right Action')
  end
end
