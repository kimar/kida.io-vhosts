server {
	listen 80;
	server_name flickr.kida.io;

	return 301 https://flickr.kida.io$request_uri;
}

server {
	listen 443 ssl;
	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	server_name flickr.kida.io;

	ssl_certificate /etc/letsencrypt/live/sfo1.kida.io/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/sfo1.kida.io/privkey.pem;

	access_log /var/log/nginx/flickr.kida.io.access.log;
	error_log /var/log/nginx/flickr.kida.io.error.log;

	location / {
		proxy_pass https://www.flickr.com/photos/kidmar;
		proxy_redirect default;
    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Protocol $scheme;
	}
}
