require 'spec_helper'

describe 'setup_webbj74::fonts::anonymous::bold' do
  let(:facts) { default_test_facts }
  it do
    should include_class('setup_webbj74::fonts::anonymous::bold')
    should contain_file("/Users/#{facts[:luser]}/Library/Fonts/Anonymous Pro B.ttf")
  end
end
