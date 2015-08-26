FROM ubuntu

MAINTAINER Gcaufy <gcaufy@gmail.com>

RUN apt-get update -y

RUN apt-get install php5 php5-mysql libapache2-mod-php5 php5-gd php5-curl php5-xdebug -yq

ADD conf/ /etc/apache2/

RUN mkdir -p /data && rm -fr /var/www && ln -s /data /var/www && mkdir /data/www.test.com && mkdir /data/www.test2.com
RUN echo '<?php echo "Hello World!<br /> This is www.test.com" ?>' > /data/www.test.com/index.php
RUN echo '<?php echo "Hello World!<br /> This is www.test2.com" ?>' > /data/www.test2.com/index.php
RUN rm /etc/apache2/sites-enabled/000*

ADD scripts/run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80
WORKDIR /data

CMD ["/run.sh"]

