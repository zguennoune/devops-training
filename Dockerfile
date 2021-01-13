FROM centos:8.3.2011
MAINTAINER zakaria guennoune <zakariya.guen@gmail.com>
RUN yum install -y rpmdevtools perl yum-utils jq wget make epel-release && \
    yum clean all && \
    #wget -c https://sourceforge.net/projects/alien-pkg-convert/files/release/alien_8.95.tar.xz && \
    #tar xf alien_8.95.tar.xz && \
   # cd alien-8.95 && \
    #perl Makefile.PL; make; make install && \
    rm -r -f /var/cache/*
RUN yum update -y
RUN yum install -y alien --allowerasing --best --skip-broken
ADD runBuild.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/runBuild.sh
WORKDIR /src
USER root

ENTRYPOINT ["/usr/local/bin/runBuild.sh"]