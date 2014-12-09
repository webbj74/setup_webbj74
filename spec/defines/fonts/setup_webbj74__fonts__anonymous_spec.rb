require 'spec_helper'

describe 'setup_webbj74::fonts::anonymous' do
  let(:title) { "foo.ttf" }
  let(:facts) { default_test_facts }

  it do
    should contain_file("/Users/#{facts[:luser]}/Library/Fonts/#{title}").
      with_source("puppet:///modules/setup_webbj74/fonts/AnonymousPro/#{title}")
  end

end
