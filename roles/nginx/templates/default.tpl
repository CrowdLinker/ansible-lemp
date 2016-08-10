server {
	listen 80;
	root {{ nginx.docroot }};
	index index.html index.htm index.php app.php app_dev.php;
	# Make site accessible from ...
	server_name {{ nginx.servername }};
	charset utf-8;
	location / {
		try_files \$uri \$uri/ /app.php?\$query_string /index.php?\$query_string;
	}
	location = /favicon.ico { log_not_found off; access_log off; }
	location = /robots.txt  { access_log off; log_not_found off; }
	error_page 404 /index.php;

	location ~ .php$ {
		try_files $uri =404;
		fastcgi_split_path_info ^(.+.php)(/.+)$;
		# With php5-fpm:
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		fastcgi_param LARA_ENV local; # Environment variable for Laravel
		fastcgi_param HTTPS on;
	}

	# Deny .htaccess file access
	location ~ /\.ht {
		deny all;
	}
}

server {
	listen 443;
	# ssl on;
	# ssl_certificate     /etc/ssl/xip.io/xip.io.crt;
	# ssl_certificate_key /etc/ssl/xip.io/xip.io.key;
	root {{ nginx.docroot }};
	index index.html index.htm index.php app.php app_dev.php;
	# Make site accessible from ...
	server_name {{ nginx.servername }};
	charset utf-8;
	location / {
		try_files \$uri \$uri/ /app.php?\$query_string /index.php?\$query_string;
	}
	location = /favicon.ico { log_not_found off; access_log off; }
	location = /robots.txt  { access_log off; log_not_found off; }
	error_page 404 /index.php;

	location ~ .php$ {
		try_files $uri =404;
		fastcgi_split_path_info ^(.+.php)(/.+)$;
		# With php5-fpm:
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		fastcgi_param LARA_ENV local; # Environment variable for Laravel
		fastcgi_param HTTPS on;
	}

	# Deny .htaccess file access
	location ~ /\.ht {
		deny all;
	}
}
