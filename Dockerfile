#centos 6.6
FROM centos:centos6

MAINTAINER songkun

# Update base image
RUN yum -y update && yum clean all

RUN yum -y install net-tools.x86_64 tar wget which rsync openssh-server openssh-clients java-1.7.0-openjdk-devel

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key

ADD id_rsa.pub /root/.ssh/authorized_keys

#ssh localhost
RUN ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
RUN cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

ADD hosts /hosts

#=========hadoop 2.3.0===============
#COPY hadoop-2.3.0-cdh5.0.2.tar.gz /usr/local/hadoop-2.3.0-cdh5.0.2.tar.gz
#RUN tar -zxf /usr/local/hadoop-2.3.0-cdh5.0.2.tar.gz -C /usr/local
#RUN cd /usr/local && ln -s ./hadoop-2.3.0-cdh5.0.2 hadoop
#RUN rm -f /usr/local/hadoop-2.3.0-cdh5.0.2.tar.gz
#=========hadoop 2.7.0===============
RUN wget -q -O - http://apache.fayea.com/hadoop/common/hadoop-2.7.0/hadoop-2.7.0.tar.gz  | tar -xzf - -C /usr/local
RUN cd /usr/local && ln -s ./hadoop-2.7.0 hadoop

RUN rm -f /usr/local/hadoop/etc/hadoop/hadoop-env.sh
ADD hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN rm -f /usr/local/hadoop/etc/hadoop/core-site.xml
ADD core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
RUN rm -f /usr/local/hadoop/etc/hadoop/hdfs-site.xml
ADD hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
RUN rm -f /usr/local/hadoop/etc/hadoop/mapred-site.xml
ADD mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
RUN rm -f /usr/local/hadoop/etc/hadoop/yarn-site.xml
ADD yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

ADD slaves /usr/local/hadoop/etc/hadoop/slaves
ADD masters /usr/local/hadoop/etc/hadoop/masters

ADD hadoop /usr/bin/hadoop
ADD run.sh ~/run.sh

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0
ENV PATH $JAVA_HOME/bin:$PATH
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop

EXPOSE 22 9000 50090 10020 19888 8050 8030 8025 8141 8088 45454
#CMD ["/usr/sbin/sshd","-D"]
CMD ["~/run.sh"]
