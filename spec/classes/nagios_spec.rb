require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'nagios' do

  let(:title) { 'nagios' }
  let(:node) { 'testing.phy.bris.ac.uk' }
  let(:facts) { { :ipaddress => '10.13.37.100' } }
  let(:facts) { {:processorcount => 1 } }
  
  describe 'Test standard installation on RedHat (client)' do
  	let(:facts) { {:osfamily => 'RedHat' } }
    it { should contain_package('nagios-plugins').with_ensure('present') }
    it { should contain_package('nrpe').with_ensure('present') }
    it { should contain_service('nrpe').with_ensure('running') }
    it { should contain_service('nrpe').with_enable('true') }
  end
  
  describe 'Test standard installation on RedHat (server)' do
  	let(:facts) { {:osfamily => 'RedHat' } }
    let(:params) { {:is_server => true } }
    it { should contain_package('nagios').with_ensure('present') }
    it { should contain_service('nagios').with_ensure('running') }
    it { should contain_service('nagios').with_enable('true') }
  end
  
end
