# Use nginx with self signed certs

If you have your own domain name, you can follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04#step-5-–-setting-up-server-blocks-recommended) after installation and [this guide](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) using Let's encrypt for ssl

## Self signed certs
- Generate cert and key
```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

- Create a strong Diffie-Hellman group
```bash
sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096
```

- create ```/etc/nginx/snippets/self-signed.conf``` and paste
follow content
```nginx
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
```

- create ```/etc/nginx/snippets/ssl-params.conf```
```nginx
ssl_protocols TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/nginx/dhparam.pem;
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
ssl_ecdh_curve secp384r1; # Requires nginx >= 1.1.0
ssl_session_timeout  10m;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off; # Requires nginx >= 1.5.9
ssl_stapling on; # Requires nginx >= 1.3.7
ssl_stapling_verify on; # Requires nginx => 1.3.7
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;
# Disable strict transport security for now. You can uncomment the following
# line if you understand the implications.
# add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
```

- create ```/etc/nginx/sites-available/example.com``` and paste follow content
```nginx
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    root /var/www/example.com/html;
    index index.html index.htm index.nginx-debian.html;

    server_name <YOUR_SERVER_IP_ADRESS>;
}
server {
    listen 80;
    listen [::]:80;

    server_name <YOUR_SERVER_IP_ADRESS>;

    return 302 https://$server_name$request_uri;
}
```

- Link

```bash
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
```

- Try to connect to your server. Just put ```https://<YOUR_SERVER_IP_ADRESS>``` in your browser
