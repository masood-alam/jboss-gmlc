#FROM centos:6
FROM ubuntu:16.04
MAINTAINER Masood Alam <masood.alam@vectracom.com>

# Execute system update
#centos RUN yum -y update && yum clean all
RUN apt-get -y update && apt-get clean all

# Install packages necessary to run EAP
#RUN yum -y install xmlstarlet saxon augeas bsdtar unzip && yum clean all


# User root user to install software
USER root

# Install necessary packages
#RUN yum -y install java-1.7.0-openjdk-devel && yum clean all
#RUN yum -y install java-1.8.0-openjdk-devel && yum clean all

ENV JAVA_JOME /usr/lib/jvm/java


#RUN yum -y install glibc.i686 && yum -y install lksctp-tools

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
#RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

# Set the working directory to jboss' user home directory
#WORKDIR /opt/jboss

# Switch back to jboss user
#USER jboss

# Set the JAVA_HOME variable to make it clear where Java is located
#ENV JAVA_HOME /usr/lib/jvm/java


#ADD jboss-5.1.0.GA-gmlc-1.0.66.tar.gz /opt
ADD gmlc-2.1.0-146-multi.tar.gz /opt
#ADD gmlc-2.1.0-146.tar.gz /opt
# all data is to persist
#ADD GMLC_SCTPManagement_sctp.xml /opt/jboss-5.1.0.GA-gmlc-1.0.66/server/default/data
#ADD SCTPManagement_sctp.xml /opt/jboss-5.1.0.GA/server/default/data
#ADD Mtp3UserPart_m3ua1.xml /opt/jboss-5.1.0.GA/server/default/data
#ADD SccpStack_sccpresource2.xml /opt/jboss-5.1.0.GA/server/default/data
#ADD SccpStack_sccprouter2.xml /opt/jboss-5.1.0.GA/server/default/data
#ADD GmlcManagement_gmlcproperties.xml /opt/jboss-5.1.0.GA/server/default/data

#MultiManagementSCTP 1.7.0-SNAPSHOT version (sctp ports may be repeated on various remote IPs)
#ADD jboss-beans.xml /opt/jboss-5.1.0.GA/server/default/deploy/restcomm-gmlc-server/META-INF
ADD sctp-api-1.7.0-SNAPSHOT.jar /opt/jboss-5.1.0.GA/server/default/deploy/restcomm-gmlc-server/lib
ADD sctp-impl-1.7.0-SNAPSHOT.jar /opt/jboss-5.1.0.GA/server/default/deploy/restcomm-gmlc-server/lib
# Set the WILDFLY_VERSION env variable
#ENV WILDFLY_VERSION 8.2.0.Final

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
#RUN cd $HOME && curl -O http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.zip && unzip wildfly-##$WILDFLY_VERSION.zip && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly && rm wildfly-$WILDFLY_VERSION.zip

# Set the JBOSS_HOME env variable
#ENV JBOSS_HOME /opt/jboss/wildfly


# Set the default command to run on boot
# This will boot jboss5 in the standalone mode and bind to all interface
CMD ["/opt/jboss-5.1.0.GA/bin/run.sh", "-b", "0.0.0.0"]
