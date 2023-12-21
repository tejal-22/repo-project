FROM centos:latest
MAINTAINER sanjanadhtrak@gmail.com
RUN yum makecache
RUN yum -y makecache && \
    yum -y install httpd zip unzip
RUN sed -i 's/^metalink/#metalink/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/^#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/^#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's/mirror.centos.org/mirror.centos.org/g' /etc/yum.repos.d/CentOS-*.repo
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
