
.PHONY: docker.create.img
docker.create.img: guard-IMAGE_NAME ## creates a docker image
	@docker build -t $(IMAGE_NAME) $(DOCKER_DIR)/.

.PHONY: docker.img.list
docker.img.list: ## lists docker images
	@docker image ls

.PHONY: docker.get.img
docker.get.img: guard-IMAGE_NAME ## get one docker image
	@docker image ls | grep -i $(IMAGE_NAME)


.PHONY: docker.run
docker.run: guard-PORTS_MAPPING guard-IMAGE_NAME
	@docker run -d -p $(PORTS_MAPPING) $(IMAGE_NAME)


.PHONY: docker.publish
docker.publish: guard-DOCKER_USERNAME guard-IMAGE_NAME ## publish a image to your hub
	@docker tag $(IMAGE_NAME) $(DOCKER_USERNAME)/$(IMAGE_NAME)
	@docker image push $(DOCKER_USERNAME)/$(IMAGE_NAME)
