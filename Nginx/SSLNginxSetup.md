# Install SSL on a linux server with certbot and nginx

## Install Certbot and it’s Nginx plugin with apt:

```bash
sudo apt install certbot python3-certbot-nginx -y
```

##  Configure the correct server block in your Nginx configuration

```bash
sudo nano /etc/nginx/sites-available/example.com
```

## Paste this

```
...
server_name example.com www.example.com;
...
```

## Verify the syntax of your configuration edits

```bash
sudo nginx -t
```

## Reload Nginx to load the new configuration if the syntax is correct

```bash
sudo systemctl reload nginx
```

## Obtaining an SSL Certificate

```bash
sudo certbot --nginx -d example.com -d www.example.com
```

## Verifying Certbot Auto-Renewal

```bash
sudo systemctl status certbot.timer
```