# Makefile

.PHONY: publish

publish:# publish hex docs
	mix hex.publish

force-publish:# force publish hex docs with --replace
	mix hex.publish --replace

nuke:# clean files and builds
	mix deps.clean --all; rm -rf deps/; rm -rf _build; rm mix.lock