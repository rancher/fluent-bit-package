VERSION:=$(shell jq .version config.json | tr -d '"')
DOCKERFILE_SOURCE:=$(shell jq .dockerfileSource config.json | tr -d '"')
MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

SED=sed
ifeq ($(shell uname), Darwin)
	SED=gsed
endif

all:
	-rm $(MAKEPATH)/Dockerfile.windows
	curl $(DOCKERFILE_SOURCE) -o $(MAKEPATH)/Dockerfile.windows
	$(SED) -i 's/^ARG FLUENTBIT_VERSION.*/ARG FLUENTBIT_VERSION=$(VERSION)/g' $(MAKEPATH)/Dockerfile.windows
	$(SED) -i 's/FLUENT_BIT_VERSION=.*/FLUENT_BIT_VERSION=$(VERSION)"/g' $(MAKEPATH)/.drone.yml
