FROM webdevops/php-apache-dev:7.4-alpine

#RUN dnf upgrade -y \
#&& dnf clean all

#RUN dnf install epel-release wget openssh-clients -y \
#&& dnf clean all

RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar \
&& chmod +x drush.phar \
&& mv drush.phar /usr/local/bin/drush \
&& drush self-update

USER root
WORKDIR /root

ADD entrypoint.sh /root
#ENTRYPOINT ["/bin/bash", "/root/entrypoint.sh"]
#
#CMD ["/usr/sbin/init"]
