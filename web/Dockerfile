FROM centos:centos7

# Update and install Icingaweb2
RUN yum -y update; \
    yum -y install  epel-release \
                    https://packages.icinga.com/epel/icinga-rpm-release-7-latest.noarch.rpm;

RUN yum -y install wget centos-release-scl httpd rh-php71-php-common rh-php71-php-pgsql; \
    yum -y install icingaweb2; \
    yum clean all;

# Run CLI setup
RUN icingacli setup config webserver apache --document-root /usr/share/icingaweb2/public

# Configure apache for Icingaweb2
RUN usermod -a -G icingaweb2 apache;
ADD src/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# Fetch postgres schema
RUN wget -O /usr/share/doc/icingaweb2/schema/pgsql.schema.sql https://raw.githubusercontent.com/Icinga/icingaweb2/master/etc/schema/pgsql.schema.sql

# Update PHP timezone
RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Jakarta/g' /etc/opt/rh/rh-php71/php.ini

# Open ports
EXPOSE 80 443

ENV container docker
ENV PGPASSWORD=icinga

CMD ["/run-httpd.sh"]
