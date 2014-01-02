# This class installs all nagios plugins
class nagios::plugins::all {
  include nagios::plugins::mysql
  include nagios::plugins::core
  include nagios::plugins::puppet
  include nagios::plugins::dhcp
  include nagios::plugins::esx
  include nagios::plugins::nagios
}
