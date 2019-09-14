out: generate
generate:
	bash generate.sh
publish: out
	bash publish.sh
all:
	bash generate.sh
	bash publish.sh
