REPOSITORY := bobpace
images = devbox dotfiles nodebox scalabox gobox

all: dotfiles

#BASE
devbox:
	@docker build -t $(REPOSITORY)/devbox .

dotfiles: devbox
	@cd dotfiles && docker build --no-cache -t $(REPOSITORY)/dotfiles .

#NODE
nodebox: devbox
	@cd nodebox && docker build -t $(REPOSITORY)/nodebox .

#SCALA
scalabox: devbox
	@cd scalabox && docker build -t $(REPOSITORY)/scalabox .

ivy2:
	@cd ivy2 && docker build -t $(REPOSITORY)/ivy2 .

#GO
gobox: devbox
	@cd gobox && docker build -t $(REPOSITORY)/gobox .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)/$(image);)

.PHONY: all devbox dotfiles nodebox scalabox ivy2 gobox clean
