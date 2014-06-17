## Creating vhosts for nagios using apache ssl module. It requires manual creation of /etc/nagios/htpasswd.users and putting DN of the user certificate.

class nagios::config::sslvhosts {
 
      apache::vhost {'nagios' :
          docroot           => '/var/www/',
          scriptaliases     => [
             {alias         => '/nagios/cgi-bin/',
              path          => '/usr/lib64/nagios/cgi-bin/',
                  }, ],

          aliases           => [ 
              {alias        => '/nagios/',
              path          => '/usr/share/nagios/html/',
                  }, ],
          
          port              => '443',
          ssl               => true,
          ssl_certs_dir     => '/etc/grid-security/certificates/',
          servername        => "${::fqdn}",
          ssl_verify_client => 'require',
          ssl_verify_depth  => '5',
          ssl_options       => ['+FakeBasicAuth'],
     
          directories       => [
             {path          => '/usr/lib64/nagios/cgi-bin/',
             options        => ['ExecCGI'],
             auth_user_file => '/etc/nagios/htpasswd.users',
             auth_require   => 'valid-user',
             auth_type      => 'basic',
             auth_name      => 'nagios',    
          },

          {
             path           => '/usr/share/nagios',
             auth_user_file => '/etc/nagios/htpasswd.users',
             auth_require   => 'valid-user',
             auth_type      => 'basic',
             auth_name      => 'nagios',

          },
          ],
          
 }
}
