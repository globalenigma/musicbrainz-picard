FROM desktopcontainers/base-debian

MAINTAINER globalenigma (https://github.com/globalenigma)

RUN apt-get -q -y update \
 && apt-get -q -y install picard locales locales-all\
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
 \
 && export LANGUAGE=en_US.UTF-8; export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; update-locale LC_CTYPE=en_US.UTF-8\
 && source ~/.bashrc\
 && locale-gen en_US.UTF-8\
 && dpkg-reconfigure locales\
 \
 && echo "picard \$*" >> /usr/local/bin/ssh-app.sh \
 && mkdir -p /rips \
 && chown app.app -R /rips \
 \
 && sed -i 's/starting services"/starting services"\n\nchmod a+rwx \/rips\n\n/g' /usr/local/bin/entrypoint.sh

VOLUME ["/rips"]
