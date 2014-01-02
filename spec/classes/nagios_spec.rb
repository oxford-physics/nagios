require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'nagios' do

  let(:title) { 'nagios' }
  let(:node) { 'testing.phy.bris.ac.uk' }
  let(:facts) { { :ipaddress => '10.13.37.100' } }
  
  describe 'Test standard installation' do
    it { should contain_package('nagios').with_ensure('present') }
    it { should contain_service('nagios').with_ensure('running') }
    it { should contain_service('nagios').with_enable('true') }
    it { should contain_file('nagios.conf').with_ensure('present') }
  end
  
  describe 'Test installation of a specific version' do
    let(:params) { {:version => '1.0.42' } }
    it { should contain_package('nagios').with_ensure('1.0.42') }
  end
  
end
