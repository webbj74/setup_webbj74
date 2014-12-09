require 'spec_helper'

describe 'setup_webbj74::fonts' do
  it do
    should include_class('setup_webbj74::fonts')
    should include_class('setup_webbj74::fonts::anonymous::all')
  end
end
