require 'spec_helper'

describe 'setup_webbj74::gitconfig' do
  it do
    should include_class('setup_webbj74::gitconfig')
    should contain_git__config__global('core.pager')
  end
end
