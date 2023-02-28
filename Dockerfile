# FROM  centos:latest
# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# RUN yum update -y
# RUN yum install -y httpd \
# zip \
# unzip
# RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# WORKDIR /var/www/html/


# RUN unzip photogenic.zip
# RUN cp -rvf photogenic/* .
# RUN rm -rf photogenic photogenic.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 9090

# FROM  centos:latest
# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# RUN yum install -y httpd \
#  zip\
#  unzip
#  RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80

FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y apache2 \
    unzip

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip shine.zip && \
    cp -rvf shine/* . && \
    rm -rf shine shine.zip && \
    chown -R www-data:www-data /var/www/html/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]

