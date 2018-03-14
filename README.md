# ampache


Requirements: docker & docker-compose

Preconfigure: place an .env file in the same directory than docker-compose.yml file and fill it with the info provided below; don't forget to fill the blanks

REPO=https://github.com/ampache/ampache.git  
AMPACHE_DOMAIN=<your.domain>  
DNS_ADMIN_MAIL=<yourmail at your domain>  
SRC_PATH=/var/www/html/ampache  
CERTS_PATH=/etc/ssl/nginx  
AWS_ACCESS_KEY_ID=  
AWS_SECRET_ACCESS_KEY=  
AWS_DEFAULT_REGION=  
S3_BUCKET=  
S3_PATH=  
S3_ARCHIVE=ampache.sql.gz  
MYSQL_ROOT_PASSWORD=  
MYSQL_HOST=mysql  
MYSQL_USER=ampache  
MYSQL_DATABASE=ampache  
MYSQL_PASSWORD=  
HTTP_PORT=8011  
HTTPS_PORT=443  
SECRET_KEY=  
CATALOG_PATH=  

Build & deploy: docker-compose up --build nginx

Post-install steps:

docker-compose exec php-fpm php /var/www/html/ampache/bin/install/update_db.inc -u

docker-compose -p subsonic exec php-fpm php  /var/www/html/ampache/bin/install/add_user.inc -u xxxx -p xxxx -l admin -n administratordocker-compose -p subsonic exec php-fpm php  /var/www/html/ampache/bin/install/add_user.inc -u XXX -p XXX -l admin -n administrator
