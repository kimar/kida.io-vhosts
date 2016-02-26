server {
  listen 443 ssl;
	ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;

	server_name blog.kida.io;
	access_log /var/log/nginx/blog.kida.io.access.log;
  error_log /var/log/nginx/blog.kida.io.error.log debug;

	ssl_certificate /etc/letsencrypt/live/xlarge.server.kida.io/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/xlarge.server.kida.io/privkey.pem;

	root /home/kimar/apps/blog.kida.io/_site;

	location / {
		try_files $uri $uri/ =404;
	}
}

server {
  listen 80;
	server_name blog.kida.io;
	return 301 https://$host$request_uri;
}
