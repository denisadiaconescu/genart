output = html/index.js

build:
	spago build

bundle:
	spago bundle-app --to ${output}

.PHONY: bundle build
