server {
  listen 80;
  server_name blog.kida.io;

  return 301 https://blog.kida.io$request_uri;
}

server {
  listen 443 ssl;
  ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;

  server_name blog.kida.io;

  ssl_certificate /etc/letsencrypt/live/sfo1.kida.io/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/sfo1.kida.io/privkey.pem;

  access_log /var/log/nginx/$domain.access.log;
  error_log /var/log/nginx/$domain.error.log;

  location / {
    proxy_pass http://kimar.github.io;
    proxy_redirect default;
    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Protocol $scheme;
  }
}
