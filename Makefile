.PHONY: clean tarball docker

tarball:
	dzil build
# Rarely do we care that dzil is already built
docker: tarball
	docker build -t fb11-demo:latest --build-arg version=`dzil distversion` .
clean:
	- dzil clean;
