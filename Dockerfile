FROM desktopcontainers/base-debian

MAINTAINER globalenigma (https://github.com/globalenigma)

RUN apt-get -q -y update \
 && apt-get -q -y install picard \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
 \
 && echo "picard \$*" >> /usr/local/bin/ssh-app.sh \
 && mkdir -p /rips \
 && chown app.app -R /rips \
 \
 && sed -i 's/starting services"/starting services"\n\nchmod a+rwx \/rips\n\n/g' /usr/local/bin/entrypoint.sh

VOLUME ["/rips"]
