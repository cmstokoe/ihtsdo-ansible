Role Name
========

Role to install Jenkins, optionally behind nginx, no Ubuntu/Debian. Tested on Ubuntu precise.

Remember to get new key etc from Github for authentication
add key for user for ssh

  876  ssh -v -L8101:cu023.servers.aceworkspace.net:22 otf_jenkins@mgr.servers.aceworkspace.net -i /var/lib/jenkins/.ssh/id_rsa2
  889  ssh -v otf_jenkins@localhost -p8101 -i /var/lib/jenkins/.ssh/id_rsa2


Requirements
------------

If you're using the nginx proxying function, make sure you set something like the following in your inventory.

```yaml
nginx_http_params:
  types_hash_bucket_size: 64
  client_max_body_size: 100M
  server_names_hash_bucket_size: 64
nginx_sites: []
```

Role Variables
--------------

Here are the role variables and their defaults

jenkins_release: stable ( Can be set to stable or latest )

jenkins_listen_address: 0.0.0.0 ( Bind address for Jenkins )
jenkins_listen_port: 8080 ( Bind port for Jenkins )
jenkins_context: /jenkins ( Context for Jenkins. Set to / when using nginx )

jenkins_nginx: off ( Boolean, set to true to enable nginx proxying to Jenkins )
jenkins_nginx_fqdn: jenkins ( The what server_name gets set to for the nginx server )
jenkins_nginx_default_site: off ( Whether default should be set on server_name )
jenkins_nginx_ssl: no ( If True, enable SSL. Needs the cert and key definiting. HTTP redirects to HTTPS)
jenkins_nginx_ssl_cert_file: jenkins.crt ( Ansible path to the SSL certificate to use with nginx )
jenkins_nginx_ssl_key_file: jenkins.key ( Ansible path to the SSL key to use with nginx )

Dependencies
------------

IHTSDO.openjdk to install Java
IHTSDO.nginx for the Nginx (if enabled)

Example Playbook
-------------------------

    - hosts: jenkins
      sudo: True
      roles:
         - { role: IHTSDO.jenkins }

License
-------

BSD

Author Information
------------------

Matt Willsher , matt at willsherpartners.co.uk
