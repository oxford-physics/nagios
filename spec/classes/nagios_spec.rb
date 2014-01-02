require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'nagios' do

  let(:title) { 'nagios' }
  let(:node) { 'testing.phy.bris.ac.uk' }
  let(:facts) { { :ipaddress => '10.13.37.100' } }
  
  describe 'Test standard installation (client)' do
    it { should contain_package('nagios-plugins').with_ensure('present') }
    it { should contain_package('nrpe').with_ensure('present') }
    it { should contain_service('nrpe').with_ensure('running') }
    it { should contain_service('nrpe').with_enable('true') }
  end
  
  describe 'Test standard installation (server)' do
    let(:params) { {:is_server => true } }
    it { should contain_package('nagios').with_ensure('present') }
    it { should contain_service('nagios').with_ensure('running') }
    it { should contain_service('nagios').with_enable('true') }
  end
  
end
