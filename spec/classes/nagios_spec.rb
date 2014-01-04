require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'nagios' do

  let(:title) { 'nagios' }
  let(:node) { 'testing.phy.bris.ac.uk' }
  let(:facts) { {
  	:ipaddress => '10.13.37.100', 
  	:processorcount => 1, 
  	:osfamily => 'RedHat', 
  	:operatingsystem => 'Redhat',
  	:operatingsystemrelease => '6.4'} }
  
  describe 'Test standard installation on RedHat (client)' do
    it { should contain_package('nagios-plugins').with_ensure('installed') }
    it { should contain_package('nrpe').with_ensure('installed') }
    it { should contain_service('nrpe').with_ensure('running') }
    it { should contain_service('nrpe').with_enable('true') }
  end
  
  describe 'Test standard installation on RedHat (server)' do
    let(:params) { {:is_server => true } }
    it { should contain_package('nagios').with_ensure('installed') }
    it { should contain_service('nagios').with_ensure('running') }
    it { should contain_service('nagios').with_enable('true') }
  end
  
end
