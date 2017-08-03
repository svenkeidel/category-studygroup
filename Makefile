all: generate

exercises: nix generate

generate:
	pushd src; \
	latexmk -pdf -output-directory=../pdf/ *.tex; \
	popd

nix:
	nix-build
