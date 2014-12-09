require 'spec_helper'

describe 'setup_webbj74::apps' do
  let(:facts) { default_test_facts }
  it do
    should contain_package('Things')
  end
end
