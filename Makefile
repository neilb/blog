.PHONY: clean build push watch-server
export PATH := $(shell pwd)/bin:$(PATH)

log = ../s3cmd.log

watch-server:
	hugo-0.49 server --bind=0.0.0.0 --watch

clean:
	test -z "$(shell git status --porcelain)" || ( echo 'uncommited changes!'; exit 1)
	rm public/* -rf

build: clean
	test -z "$(shell git grep -F ']()' '*.md')"
	bin/check-guids && hugo-0.49 --quiet

push: build
	git push --quiet
	cd public && s3cmd sync --delete-removed --disable-multipart --no-preserve /pwd/ s3://blog.afoolishmanifesto.com | tee $(log) && set-redirects && . ~/.cf-token && busted-urls $(log) && rm $(log)
