# FROM  centos:7
# RUN yum install -y httpd \
# zip \
# unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip photogenic.zip
# RUN cp -rvf photogenic/* .
# RUN rm -rf photogenic photogenic.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 9090 

# Use an existing image as a base
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY app.py .

# Install Python and pip
RUN apk add --update --no-cache python3 py3-pip

# Install the required Python packages
RUN pip3 install flask

# Expose the application port
EXPOSE 9090

# Start the application
CMD ["python3", "app.py"]





