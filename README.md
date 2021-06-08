# Packaging for fluent-bit

[![dockerhub](https://img.shields.io/docker/v/rancher/fluent-bit?sort=semver&style=flat-square)](https://hub.docker.com/r/rancher/fluent-bit/tags)

`fluent-bit` image packaging for Rancher's Logging v2, which uses the [banzaicloud/logging-operator](https://github.com/banzaicloud/logging-operator).

## Updating

1. Change the value(s) in `config.json` to the new version(s).
1. Run `make`.
1. Commit those changes and push/merge into the main branch (`master`).
1. Tag a new release and push into the main branch (`master`).

## Testing with the Upstream Chart

One way to test the upstream chart with this package is to edit the default repository and tag in the Go code, and then test the chart locally.

```sh
make manifests
make generate
make install
go run main.go
helm install logging-demo ./charts/logging-demo --set "minio.enabled=True"
```
