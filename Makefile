REPOSITORY := bobpace
images = x11dockerhost home dotfiles data scalabox sbtcache gobox gopath devbox postgres

all: x11dockerhost home dotfiles data

#BASE
devbox:
	@docker build -t $(REPOSITORY)/devbox .

devbox-no-cache:
	@docker build --no-cache -t $(REPOSITORY)/devbox .

dotfiles: devbox
	@cd dotfiles && docker build --no-cache -t $(REPOSITORY)/dotfiles .

home:
	@cd home && docker build -t $(REPOSITORY)/home .

data:
	@cd data && docker build -t $(REPOSITORY)/data .

#DOCKER HOST
x11dockerhost:
	@cd x11dockerhost && docker build -t $(REPOSITORY)/x11dockerhost .

#SCALA
scalabox: devbox
	@cd scalabox && docker build -t $(REPOSITORY)/scalabox .

sbtcache:
	@cd sbtcache && docker build -t $(REPOSITORY)/sbtcache .

#GO
gobox: devbox
	@cd gobox && docker build -t $(REPOSITORY)/gobox .

gopath:
	@cd gopath && docker build -t $(REPOSITORY)/gopath .

#Haskell
haskellbox: devbox
	@cd haskellbox && docker build -t $(REPOSITORY)/haskellbox .

#Postgres with PLV8
postgres:
	@cd postgres && docker build -t $(REPOSITORY)/postgres .

monobox: devbox
	@cd monobox && docker build -t $(REPOSITORY)/monobox .

octavebox: devbox
	@cd octavebox && docker build -t ${REPOSITORY}/octavebox .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)/$(image);)

.PHONY: all devbox devbox-no-cache dotfiles home data scalabox sbtcache gobox gopath x11dockerhost postgres clean
