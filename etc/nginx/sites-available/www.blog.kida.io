server {
  listen 80;
  server_name www.blog.kida.io;

  return 301 https://blog.kida.io$request_uri;
}

server {
  listen 443 ssl;
  server_name www.blog.kida.io;

  ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;

  ssl_certificate /etc/letsencrypt/live/sfo1.kida.io/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/sfo1.kida.io/privkey.pem;

  return 301 $scheme://blog.kida.io$request_uri;
}
