# docker-socat-static

> A Docker image for [`socat`](http://www.dest-unreach.org/socat/),
> statically compiled with `musl`

[![CI](https://github.com/ep76/docker-socat-static/actions/workflows/ci.yml/badge.svg?branch=main)](
  https://github.com/ep76/docker-socat-static/actions/workflows/ci.yml
)
[![DockerHub](https://img.shields.io/docker/v/ep76/socat-static/latest)](
  https://hub.docker.com/r/ep76/socat-static/tags?page=1&ordering=last_updated
)

## Usage

### In shell

```shell
$ docker run --rm ep76/socat-static:latest -V
# <version string>
```

### In Dockerfile

```Dockerfile
COPY --from=ep76/socat-static:latest /usr /usr
```

## License

[MIT](./LICENSE)
