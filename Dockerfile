# Versions
# https://hub.docker.com/r/serversideup/php/tags?name=8.4-fpm-nginx-alpine3.22-v3.6.1
ARG SERVERSIDEUP_PHP_VERSION=8.4-fpm-nginx-alpine
# https://github.com/minio/mc/releases
ARG MINIO_VERSION=RELEASE.2025-03-12T17-29-24Z
# https://github.com/cloudflare/cloudflared/releases
ARG CLOUDFLARED_VERSION=2025.2.0
# https://www.postgresql.org/support/versioning/
ARG POSTGRES_VERSION=15

# Add user/group
ARG USER_ID=9999
ARG GROUP_ID=9999

# =================================================================
# Stage 1: Composer dependencies
# =================================================================
FROM serversideup/php:${SERVERSIDEUP_PHP_VERSION} AS base

USER root

ARG USER_ID
ARG GROUP_ID

RUN install-php-extensions bcmath exif && \
    docker-php-serversideup-set-id www-data $USER_ID:$GROUP_ID && \
    docker-php-serversideup-set-file-permissions --owner $USER_ID:$GROUP_ID --service nginx

USER www-data
