# ubuntu.apache

### Build
docker build -t ubuntu.apache .

### Run
docker run -d -p 80:80 -v /data/docker/apache/logs:/var/log/apache2 -v /data/docker/apache/app:/data --link ubuntu.mysql:db --name lamp ubuntu.apache
