server_version=6.3.13

base_image=fsslc/base:18.04
base_image_squashed=fsslc/base:18.04-squashed
pro_base_image=fsslc/pro-base:18.04
pro_base_image_squashed=fsslc/pro-base:18.04-squashed
pro_server_image=fsslc/seafile-pro:$(server_version)
pro_server_image_squashed=fsslc/seafile-pro:$(server_version)-squashed
latest_pro_server_image=fsslc/seafile-pro:latest

all:
	@echo
	@echo Pleaes use '"make base"' or '"make pro-base"' or '"make push"'.
	@echo

base:
	docker pull phusion/baseimage:0.11
	docker-squash --tmp-dir ${HOME}/tmp --tag phusion/baseimage:latest phusion/baseimage:0.11
	docker tag phusion/baseimage:latest phusion/baseimage:0.11
	cd base && docker build -t $(base_image) .
	docker-squash --tmp-dir ${HOME}/tmp --tag $(base_image_squashed) $(base_image)
	docker tag $(base_image_squashed) $(base_image)
	docker rmi `docker images --filter "dangling=true" -q --no-trunc`

pro-base:
	cd pro_base && docker build -t $(pro_base_image) .
	docker-squash --tmp-dir ${HOME}/tmp --tag $(pro_base_image_squashed) $(pro_base_image)
	docker tag $(pro_base_image_squashed) $(pro_base_image)
	docker rmi `docker images --filter "dangling=true" -q --no-trunc`

pro-server:
	cd pro_seafile && docker build -t $(pro_server_image) .
	docker-squash --tmp-dir ${HOME}/tmp --tag $(pro_server_image_squashed) $(pro_server_image) --from-layer=$(pro_base_image)
	docker tag $(pro_server_image_squashed) $(pro_server_image)
	docker tag $(pro_server_image) $(latest_pro_server_image)
	docker rmi `docker images --filter "dangling=true" -q --no-trunc`

push-base:
	docker push $(base_image)

push-pro-base:
	docker push $(pro_base_image)

push-pro-server:
	docker push $(pro_server_image)
	docker push $(latest_pro_server_image)

push: push-base push-pro-base push-pro-server

.PHONY: base pro-base pro-server push
