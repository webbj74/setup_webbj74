require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'setup_webbj74' do
  it do
    should include_class('setup_webbj74')
    should include_class('setup_webbj74::apps')
    should include_class('setup_webbj74::fonts')
    should include_class('setup_webbj74::gitconfig')
    should include_class('setup_webbj74::osx')
  end
end
