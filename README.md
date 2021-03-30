# Packaging for fluent-bit

`fluent-bit` image packaging for Rancher's Logging v2, which uses the [banzaicloud/logging-operator](https://github.com/banzaicloud/logging-operator).

## Updating

1. Change the value in `version.json` to the new version.
1. Run `make sync`.
1. Commit those changes and push/merge into the main branch (`master`).
1. Tag a new release with `make tag`.
