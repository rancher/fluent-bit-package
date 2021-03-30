# Packaging for fluent-bit

`fluent-bit` image packaging for Rancher's Logging v2, which uses the [banzaicloud/logging-operator](https://github.com/banzaicloud/logging-operator).

## Updating

1. Change the value in `version.json`.
1. Run `make`.
1. Commit those changes.
1. Tag a new release with `git tag`.
