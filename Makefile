REPOSITORY := bobpace/devbox
images = base home node scala go

all: home node scala go

base:
	@docker build -t $(REPOSITORY)-base .

home: base
	@cd home && docker build --no-cache -t $(REPOSITORY)-home .

node: base
	@cd node && docker build -t $(REPOSITORY)-node .

scala: base
	@cd scala && docker build -t $(REPOSITORY)-scala .

go: base
	@cd go && docker build -t $(REPOSITORY)-go .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)-$(image);)

.PHONY: all base home node scala go clean
