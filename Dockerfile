FROM centos:8.3.2011
MAINTAINER zakaria guennoune <zakariya.guen@gmail.com>

RUN yum install -y rpmdevtools yum-utils jq && \
    yum clean all && \
    rm -r -f /var/cache/*
ADD runBuild.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/runBuild.sh 
USER root

ENTRYPOINT ["/usr/local/bin/runBuild.sh"]