/etc/apache2/envars:
  file.managed:
    - source: salt://macapinlac/files/envars

/var/lib/php5:
  file.directory:
    - recurse:
      - mode
    - mode: 777
