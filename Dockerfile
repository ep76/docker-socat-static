FROM alpine:3.14 AS socat-builder
ARG socat_url=http://www.dest-unreach.org/socat/download/socat-1.7.4.1.tar.gz
RUN \
  cd /tmp && \
  apk add --no-cache \
    curl \
    gcc \
    linux-headers \
    make \
    musl-dev \
    ncurses-dev \
    ncurses-static \
    openssl-dev \
    openssl-libs-static \
    readline-dev \
    readline-static \
    && \
  curl -fsSL "${socat_url}" | tar xz --strip-components=1 && \
  sed -i 's/ncurses/ncursesw/g' configure && \
  ./configure \
    --prefix=/usr \
    CPPFLAGS=-DNETDB_INTERNAL=-1 \
    LDFLAGS=-static \
    && \
  sed -i 's|<netinet/if_ether\.h>|<linux/if_ether.h>|' sysincludes.h && \
  make install prefix=/socat datarootdir=.

FROM scratch
LABEL maintainer="https://github.com/ep76/socat-static"
COPY --from=socat-builder /socat /usr
ENTRYPOINT [ "/usr/bin/socat" ]
