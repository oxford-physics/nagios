# Standard nagios group templates
class nagios::templates inherits nagios::params {
  # Contact templates
  @@nagios_contact { 'generic-contact':
    service_notification_period   => '24x7',
    host_notification_period      => '24x7',
    service_notification_options  => 'c,r,f,s',
    host_notification_options     => 'd,u,r,f,s',
    service_notification_commands => 'notify-service-by-email',
    host_notification_commands    => 'notify-host-by-email',
    register                      => '0',
    tag                           => $nagios_server,
  }

  # Host templates
  @@nagios_host { 'generic-host':
    notifications_enabled        => '1',
    event_handler_enabled        => '1',
    flap_detection_enabled       => '1',
    failure_prediction_enabled   => '1',
    process_perf_data            => '1',
    retain_status_information    => '1',
    retain_nonstatus_information => '1',
    notification_period          => '24x7',
    register                     => '0',
    check_period                 => '24x7',
    check_interval               => '5',
    retry_interval               => '2',
    max_check_attempts           => '5',
    check_command                => 'check-host-alive',
    notification_interval        => '0',
    notification_options         => 'd,r',
    tag                          => $nagios_server,
  }

  # Service templates
  @@nagios_service { 'generic-service':
    active_checks_enabled        => '1',
    passive_checks_enabled       => '1',
    parallelize_check            => '1',
    obsess_over_service          => '1',
    check_freshness              => '0',
    notifications_enabled        => '1',
    event_handler_enabled        => '1',
    flap_detection_enabled       => '1',
    failure_prediction_enabled   => '1',
    process_perf_data            => '1',
    retain_status_information    => '1',
    retain_nonstatus_information => '1',
    is_volatile                  => '0',
    check_period                 => '24x7',
    max_check_attempts           => '3',
    normal_check_interval        => '2',
    retry_check_interval         => '1',
    contact_groups               => 'admins',
    notification_options         => 'w,c,r',
    notification_interval        => '0',
    notification_period          => '24x7',
    register                     => '0',
    tag                          => $nagios_server,
  }

  @@nagios_service { 'hourly-service':
    use                   => 'generic-service',
    register              => '0',
    normal_check_interval => '60',
    tag                   => $nagios_server,
  }

  @@nagios_service { '1min-service':
    use                   => 'generic-service',
    register              => '0',
    normal_check_interval => '1',
    tag                   => $nagios_server,
  }

  @@nagios_service { '3min-service':
    use                   => 'generic-service',
    register              => '0',
    normal_check_interval => '3',
    tag                   => $nagios_server,
  }

  @@nagios_service { '5min-service':
    use                   => 'generic-service',
    register              => '0',
    normal_check_interval => '5',
    tag                   => $nagios_server,
  }
  
  @@nagios_service { '30min-service':
    use                   => 'generic-service',
    register              => '0',
    normal_check_interval => '30',
    tag                   => $nagios_server,
  }

}
