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
	$(SED) -i 's/FLUENT_BIT_VERSION:.*/FLUENT_BIT_VERSION: $(FULL_VERSION)/g' $(MAKEPATH)/.drone.yml
	@echo "Short Version: $(SHORT_VERSION) -- used for downloading the Dockerfile"
	@echo "Full Version: $(FULL_VERSION)  -- used for specifying the fluent-bit version"
