REPOSITORY := bobpace/devbox
images = base dotfiles node scala go

all: dotfiles node scala go

base:
	@docker build -t $(REPOSITORY)-base .

dotfiles: base
	@cd dotfiles && docker build --no-cache -t $(REPOSITORY)-dotfiles .

node: base
	@cd node && docker build -t $(REPOSITORY)-node .

scala: base
	@cd scala && docker build -t $(REPOSITORY)-scala .

go: base
	@cd go && docker build -t $(REPOSITORY)-go .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)-$(image);)

.PHONY: all base dotfiles node scala go clean
