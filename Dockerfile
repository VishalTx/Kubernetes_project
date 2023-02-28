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

FROM centos:7

# Update packages and install unzip
RUN yum -y update && yum -y install unzip

# Download and extract the zip file to /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /tmp/photogenic.zip
RUN unzip -q /tmp/photogenic.zip 
RUN rm /tmp/photogenic.zip

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


