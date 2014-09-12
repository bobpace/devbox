REPOSITORY := bobpace/devbox

all: image

base:
	@cd devbox-base && docker build -t $(REPOSITORY)-base .

image: base
	@docker build -t $(REPOSITORY) .

clean:
	@docker rmi --force $(REPOSITORY) $(REPOSITORY)-base

.PHONY: all base devbox clean
