VERSION:=$(shell jq .version version.json | tr -d '"')
MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BRANCH:=feature/multi_fluentbit_support

all:
	-rm $(MAKEPATH)/Dockerfile.windows
	curl https://raw.githubusercontent.com/banzaicloud/logging-operator/$(BRANCH)/fluent-bit-image/$(VERSION)/Dockerfile.windows \
		-o $(MAKEPATH)/Dockerfile.windows
