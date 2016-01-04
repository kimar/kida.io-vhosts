server {
	listen 80;
	server_name intranet.kida.io;

	return 301 https://intranet.kida.io$request_uri;
}

server {
	listen 443 ssl;
	ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
	server_name intranet.kida.io;

	ssl_certificate /etc/letsencrypt/live/sfo1.kida.io/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/sfo1.kida.io/privkey.pem;

  access_log /var/log/nginx/intranet.kida.io.access.log;
	error_log /var/log/nginx/intranet.kida.io.error.log;

	location / {
    proxy_pass http://127.0.0.1:8090;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_http_version 1.1;
  }
}
