SHORT_VERSION:=$(shell jq .shortVersion version.json | tr -d '"')
FULL_VERSION:=$(shell jq .fullVersion version.json | tr -d '"')
MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BRANCH:=feature/multi_fluentbit_support

SED=sed
ifeq ($(shell uname), Darwin)
	SED=gsed
endif

all:
	-rm $(MAKEPATH)/Dockerfile.windows
	curl https://raw.githubusercontent.com/banzaicloud/logging-operator/$(BRANCH)/fluent-bit-image/v$(SHORT_VERSION)/Dockerfile.windows \
		-o $(MAKEPATH)/Dockerfile.windows
	$(SED) -i 's/^ARG FLUENTBIT_VERSION.*/ARG FLUENTBIT_VERSION=$(FULL_VERSION)/g' $(MAKEPATH)/Dockerfile.windows
	$(SED) -i 's/fluent\/fluent-bit:x86_64-.*/fluent\/fluent-bit:x86_64-$(FULL_VERSION)"/g' $(MAKEPATH)/.drone.yml
	$(SED) -i 's/fluent\/fluent-bit:arm64v8-.*/fluent\/fluent-bit:arm64v8-$(FULL_VERSION)"/g' $(MAKEPATH)/.drone.yml
	$(SED) -i 's/fluent\/fluent-bit:arm32v7-.*/fluent\/fluent-bit:arm32v7-$(FULL_VERSION)"/g' $(MAKEPATH)/.drone.yml
	@echo "Short Version: $(SHORT_VERSION) -- used for downloading the Dockerfile"
	@echo "Full Version: $(FULL_VERSION)  -- used for specifying the fluent-bit version"
