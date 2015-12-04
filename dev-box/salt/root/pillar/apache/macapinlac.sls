apache:
  sites:
    000-default:
      enabled: False

    macapinlac:
      enabled: True
      Options: +FollowSymLinks
      Allow: from all
      ServerName: macapinlac.com
      DocumentRoot: /vagrant/site
      Directory:
        /vagrant/site:
          AllowOverride: All

  modules:
    enabled:
      - cache
      - expires
      - headers
      - php5
      - rewrite
