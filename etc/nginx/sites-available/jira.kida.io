server {
	listen 80;
	server_name jira.kida.io;

	return 301 https://jira.kida.io$request_uri;
}

server {
	listen 443 ssl;
	ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
	server_name jira.kida.io;

	ssl_certificate /etc/letsencrypt/live/sfo1.kida.io/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/sfo1.kida.io/privkey.pem;

  access_log /var/log/nginx/jira.kida.io.access.log;
	error_log /var/log/nginx/jira.kida.io.error.log;

	location / {
		proxy_pass http://localhost:8080;
		proxy_set_header X-Forwarded-Host $host;
		proxy_set_header X-Forwarded-Server $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		proxy_http_version 1.1;
		proxy_connect_timeout       600;
		proxy_send_timeout          600;
		proxy_read_timeout          600;
		send_timeout                600;
	}
}
