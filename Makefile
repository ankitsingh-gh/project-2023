DOCKER_REGISTRY=docker.io
DOKCER_REPO=jenkins-agent
DOKCER_TAG=

BUILD_ROOT=./build-system

.PHONY: docker-check docker-login deploy 


check-docker:
	@if which docker >/dev/null; then \
        docker version; \
    else \
        echo "Docker is not installed"; \
    fi

agent1:
	@docker build . -f Dockerfile.$@ -t ${DOCKER_REGISTRY}/${DOKCER_REPO}:$@


agent2:
	@docker build . -f Dockerfile.$@ -t ${DOCKER_REGISTRY}/${DOKCER_REPO}:$@


#[Docker] publish slave docker image to registry
docker-login:
	docker login $(DOCKER_REGISTRY) -u $(USER) -p $(PASSWD) > /dev/null 2>&1

deploy: docker-login
ifdef DOCKER_DEPLOY_TAG
	@docker login $(DOCKER_REGISTRY)
	@echo "Pushing ${DOCKER_REGISTRY}/${DOKCER_REPO}:$(DOCKER_DEPLOY_TAG)"
	@docker push ${DOCKER_REGISTRY}/${DOKCER_REPO}:$(DOCKER_DEPLOY_TAG)
else
	@echo "DOCKER_DEPLOY_TAG is not defined"
endif


clean:
ifdef DOCKER_DEPLOY_TAG
	@docker rmi ${DOCKER_REGISTRY}/${DOKCER_REPO}:$(DOCKER_DEPLOY_TAG)
else
	@echo "DOCKER_DEPLOY_TAG is not defined, Nothing to clean..."
endif