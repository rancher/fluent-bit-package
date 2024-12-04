# Packaging for Windows `fluent-bit` Images

[![dockerhub](https://img.shields.io/docker/v/rancher/fluent-bit?sort=semver&style=flat-square)](https://hub.docker.com/r/rancher/fluent-bit/tags)

This repository houses `fluent-bit` Windows image packaging for [Rancher Logging](https://rancher.com/docs/rancher/v2.5/en/logging/), which is based on the [kube-logging/logging-operator](https://github.com/kube-logging/logging-operator).
For Linux images, use upstream [fluent/fluent-bit](https://hub.docker.com/r/fluent/fluent-bit) or [rancher/mirrored-fluent-fluent-bit](https://hub.docker.com/r/rancher/mirrored-fluent-fluent-bit).

## Updating

Since the upstream fluent-bit project has started building Windows images themselves, the goal of this repository is only to generate a Docker manifest to deploy Windows-2019 and Windows-2022 images under the same tag. To do that only one step is needed:

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
