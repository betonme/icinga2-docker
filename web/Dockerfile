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

# Install Icinga module ipl
git clone https://github.com/icinga/icingaweb2-module-ipl /usr/share/icingaweb2/modules/ipl --branch v0.5.0
#icingacli module enable ipl

# Install Icinga module incubator
git clone https://github.com/icinga/icingaweb2-module-incubator /usr/share/icingaweb2/modules/incubator --branch v0.5.0
#icingacli module enable incubator

# Install Icinga module reactbundle
git clone https://github.com/icinga/icingaweb2-module-reactbundle /usr/share/icingaweb2/modules/reactbundle --branch v0.7.0
#icingacli module enable reactbundle

# Install Icinga module director
git clone https://github.com/icinga/icingaweb2-module-director /usr/share/icingaweb2/modules/director --branch v0.7.0
#icingacli module enable director

# Open ports
EXPOSE 80 443

ENV container docker
ENV PGPASSWORD=icinga

CMD ["/run-httpd.sh"]
