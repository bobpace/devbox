REPOSITORY := bobpace/devbox
images = devbox dotfiles node scala go

all: dotfiles node scala go

devbox:
	@docker build -t $(REPOSITORY) .

dotfiles: devbox
	@cd dotfiles && docker build --no-cache -t $(REPOSITORY)-dotfiles .

node: devbox
	@cd node && docker build -t $(REPOSITORY)-node .

scala: devbox
	@cd scala && docker build -t $(REPOSITORY)-scala .

go: devbox
	@cd go && docker build -t $(REPOSITORY)-go .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)-$(image);)

.PHONY: all devbox dotfiles node scala go clean
