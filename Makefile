.PHONY: all build push

IMAGE	?= cryptobiff/jq
LATEST ?= latest

ifeq ($(shell test -e VERSION && echo -n yes),yes)
    VERSION = $(shell cat VERSION)
endif

all: build push-latest gen-version tag-version push-version

build:
	docker build -t  $(IMAGE):$(LATEST) .

push-latest:
	docker push $(IMAGE):$(LATEST)

gen-version:
	echo "1.6" > VERSION

tag-version:
	docker tag $(IMAGE):$(LATEST) $(IMAGE):$(shell cat VERSION)

push-version:
	docker push $(IMAGE):$(shell cat VERSION)