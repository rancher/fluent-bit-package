# Packaging for Windows `fluent-bit` Images

[![dockerhub](https://img.shields.io/docker/v/rancher/fluent-bit?sort=semver&style=flat-square)](https://hub.docker.com/r/rancher/fluent-bit/tags)

This repository houses `fluent-bit` Windows image packaging for [Rancher Logging](https://rancher.com/docs/rancher/v2.5/en/logging/), which is based on the [banzaicloud/logging-operator](https://github.com/banzaicloud/logging-operator).
For Linux images, use upstream [fluent/fluent-bit](https://hub.docker.com/r/fluent/fluent-bit) or [rancher/mirrored-fluent-fluent-bit](https://hub.docker.com/r/rancher/mirrored-fluent-fluent-bit).

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
