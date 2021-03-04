FROM centos:latest
# install the PHP extensions we need
# see https://secure.php.net/manual/en/opcache.installation.php
RUN export uid=0 gid=0
RUN mkdir -p /home/developer

RUN dnf install epel-release -y \
&& dnf upgrade -y \
&& dnf clean all

RUN dnf groupinstall "Server with GUI" --allowerasing -y \
&& dnf clean all

RUN systemctl set-default graphical.target

USER root
#WORKDIR /home

CMD ["/usr/sbin/init"]


#RUN dnf install dnf-plugins-core; \
#dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo -y;

#RUN systemctl set-default graphical;
#dnf install dnf-plugins-core; \
#dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo;

#		Graphical shell


#RUN { \
#		echo 'opcache.memory_consumption=128'; \
#		echo 'opcache.interned_strings_buffer=8'; \
#		echo 'opcache.max_accelerated_files=4000'; \
#		echo 'opcache.revalidate_freq=60'; \
#		echo 'opcache.fast_shutdown=1'; \
#	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

#RUN set -eux; \
#	curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz; \
#	echo "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c -; \
#	tar -xz --strip-components=1 -f drupal.tar.gz; \
#	rm drupal.tar.gz; \
#	chown -R www-data:www-data sites modules themes
#
#RUN cp -r /var/www/html/ /dev/www/
# vim:set ft=dockerfile:
#COPY /dev/var/www/html/ /var/www/html/