REPOSITORY := bobpace
images = devbox dotfiles data nodebox scalabox sbtcache gobox

all: dotfiles data

#BASE
devbox:
	@docker build -t $(REPOSITORY)/devbox .

dotfiles: devbox
	@cd dotfiles && docker build --no-cache -t $(REPOSITORY)/dotfiles .

data:
	@cd data && docker build -t $(REPOSITORY)/data .

#NODE
nodebox: devbox
	@cd nodebox && docker build -t $(REPOSITORY)/nodebox .

#SCALA
scalabox: devbox
	@cd scalabox && docker build -t $(REPOSITORY)/scalabox .

sbtcache:
	@cd sbtcache && docker build -t $(REPOSITORY)/sbtcache .

#GO
gobox: devbox
	@cd gobox && docker build -t $(REPOSITORY)/gobox .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)/$(image);)

.PHONY: all devbox dotfiles data nodebox scalabox sbtcache gobox clean
