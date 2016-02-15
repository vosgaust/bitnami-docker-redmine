FROM bitnami/base-apps-ubuntu:14.04
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=redmine \
    BITNAMI_APP_VERSION=3.2.0-2 \
    BITNAMI_APP_USER=bitnami \
    BITNAMI_APPLICATION_USER=user \
    BITNAMI_APPLICATION_PASSWORD=bitnami \
    IS_BITNAMI_STACK=1

#Download latest Redmine Stack from bitnami.com
RUN $BITNAMI_PREFIX/install.sh \
    --base_user $BITNAMI_APPLICATION_USER --base_password $BITNAMI_APPLICATION_PASSWORD --apache_mpm_mode event --enable_phpfpm 1 --logrotate_install 1 --disable-components subversion && \
    rm $BITNAMI_PREFIX/install.sh

EXPOSE 80 443 22

#Using the instruction WORKDIR won't work if using volumes
ENV WORKDIR=$BITNAMI_PREFIX/apps/$BITNAMI_APP_NAME/htdocs
