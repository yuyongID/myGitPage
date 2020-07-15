SHELL := /bin/bash

build:
	docker run --rm -it -v ${PWD}:/src klakegg/hugo:0.73.0-ext-asciidoctor-onbuild

server:
	docker run --rm -it -v ${PWD}:/src -p 1313:1313 klakegg/hugo:0.73.0-ext-asciidoctor-onbuild server

.PHONY: build server
