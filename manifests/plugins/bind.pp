# Nagios plugins and config for bind DNS servers
class nagios::plugins::bind {
  # check_bind
  nagios::plugin { 'check_bind': }

  nagios::config::nrpe { 'check_bind': command => 'check_bind -N -p /var/run -n named.pid -V 9.5 -s /var/log/named', 
  }
  User <| title == 'nrpe' |> {
    groups +> 'named'
  }
}
