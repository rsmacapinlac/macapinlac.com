/etc/apache2/envvars:
  file.managed:
    - source: salt://macapinlac/files/envvars

/var/lib/php5:
  file.directory:
    - recurse:
      - mode
    - mode: 777

grav_configuration:
  file.directory:
    - names:
      - /vagrant/site/cache
      - /vagrant/site/logs
      - /vagrant/site/images
      - /vagrant/site/assets
      - /vagrant/site/user/data
      - /vagrant/site/backup
    - recurse:
      - mode
    - mode: 775
