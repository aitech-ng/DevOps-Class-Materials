# Different Nginx Configuration files

- A Basic Nginx Configuration file:

```nginx
server {
    listen 80;
    server_name _;

    location / {
        root /var/www/html;
        index index.html index.htm;
    }

}
```

- An Nginx Configuration with SSL certificates:

```nginx
server {
    listen 443 ssl;
    server_name  www.example.com example.com;

    ssl_certificate /etc/nginx/cert/app.crt;
    ssl_certificate_key /etc/nginx/cert/app.key;

    location / {
        root /var/www/html;
        index index.html index.htm;
    }
}
```

- An Nginx Configuration with SSL certificates installed by LetsEncrypt:

```nginx

server {

    server_name www.example.com example.com; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        root /var/www/html;
        index index.html index.htm;
    }

}
```

- An Nginx Configuration for a reverse proxy:

```nginx

server {
    server_name www.example.com example.com; # managed by Certbot   

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/ {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

```

- An Nginx Configuration for a reverse proxy with multiple server blocks:

```nginx
server {

    server_name www.appOne.com appOne.com; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/appOne.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/appOne.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {

    server_name www.appTwo.com appTwo.com; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/appTwo.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/appTwo.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

- An Nginx Configuration that redirects requests from http(port 80) to https(port 443):

```nginx
server {
    listen 80 ;
    listen [::]:80 ;
    server_name www.example.com example.com;    
    if ($host = www.example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    return 404; # managed by Certbot

}
```