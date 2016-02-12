
server {

	root /home/www/print.treetoweb.com;
	index index.html index.htm;

	server_name print.treetoweb.com;

	location / {
		proxy_pass http://127.0.0.1:4000;    
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
	}
    access_log /home/www/shared/log/print.treetoweb-access.log;
    error_log /home/www/shared/log/print.treetoweb-error.log;
    error_page 404 /404.html;
}
