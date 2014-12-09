require 'spec_helper'

describe 'setup_webbj74::fonts::anonymous::all' do
  let(:facts) { default_test_facts }
  it do
    should include_class('setup_webbj74::fonts::anonymous::all')
    should include_class('setup_webbj74::fonts::anonymous::regular')
    should include_class('setup_webbj74::fonts::anonymous::bold')
    should include_class('setup_webbj74::fonts::anonymous::italic')
    should include_class('setup_webbj74::fonts::anonymous::bold_italic')
  end
end
