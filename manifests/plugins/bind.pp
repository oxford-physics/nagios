# Nagios plugins and config for bind DNS servers
class nagios::plugins::bind {
  # check_bind
  nagios::plugin { 'check_bind': }

  $bind_params = '-N -p /var/run -n named.pid -V 9.5 -s /var/log/named'

  nagios::config::nrpe { 'check_bind':
    command => "check_bind ${bind_params}",
  }

  User <| title == 'nrpe' |> {
    groups +> 'named'
  }
}
