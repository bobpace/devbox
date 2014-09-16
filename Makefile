REPOSITORY := bobpace/devbox
images = base dotfiles nodejs scala go

all: nodejs scala go

base:
	@cd base && docker build -t $(REPOSITORY)-base .

dotfiles: base
	@cd dotfiles && docker build -t $(REPOSITORY)-dotfiles .

nodejs: dotfiles
	@cd nodejs && docker build -t $(REPOSITORY)-nodejs .

scala: dotfiles
	@cd scala && docker build -t $(REPOSITORY)-scala .

go: dotfiles
	@cd go && docker build -t $(REPOSITORY)-go .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)-$(image);)

.PHONY: all base dotfiles nodejs scala go clean
