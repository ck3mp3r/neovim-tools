IMAGE_VERSION=snapshot
PASSWORD="super secret"

build:
	docker build -t ckemper/neovim-tools:${IMAGE_VERSION} .

run:
	docker run \
	--rm \
	-v `pwd`:/work \
  -it ckemper/neovim-tools:${IMAGE_VERSION}

sh:
	docker run \
	--rm \
	-v `pwd`:/work \
	--entrypoint=ash \
  -it ckemper/neovim-tools:${IMAGE_VERSION}

login:
	docker login -u ckemper -p ${PASSWORD}

publish:
	docker push \
		ckemper/neovim-tools:${IMAGE_VERSION}

publish-latest:
	docker tag \
		ckemper/neovim-tools:${IMAGE_VERSION} \
		ckemper/neovim-tools:latest
	docker push \
		ckemper/neovim-tools:latest
