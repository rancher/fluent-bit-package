VERSION:=$(shell jq .version version.json | tr -d '"')
MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BRANCH:=feature/multi_fluentbit_support

help:
	@echo "See README.md for instructions (version: $(VERSION))"

sync:
	@printf "Using version: $(VERSION)\n"
	-rm $(MAKEPATH)/Dockerfile.windows
	curl https://raw.githubusercontent.com/banzaicloud/logging-operator/$(BRANCH)/fluent-bit-image/$(VERSION)/Dockerfile.windows \
		-o $(MAKEPATH)/Dockerfile.windows

tag:
	git tag $(VERSION)
	git push --tags origin master
