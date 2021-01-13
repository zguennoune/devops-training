FROM centos:8.3.2011
MAINTAINER zakaria guennoune <zakariya.guen@gmail.com>
RUN dnf install -y perl
RUN yum install -y rpmdevtools yum-utils jq wget make && \
    yum clean all && \
    wget -c https://sourceforge.net/projects/alien-pkg-convert/files/release/alien_8.95.tar.xz && \
    tar xf alien_8.95.tar.xz && \
    cd alien-8.95 && \
    perl Makefile.PL; make; make install && \
    rm -r -f /var/cache/*
ADD runBuild.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/runBuild.sh
WORKDIR /src
USER root

ENTRYPOINT ["/usr/local/bin/runBuild.sh"]