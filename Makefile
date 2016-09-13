REPOSITORY := bobpace
images = x11dockerhost home dotfiles data devbox postgres haskellbox octavebox fsharpbox

all: devbox x11dockerhost home dotfiles data

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

#Other
haskellbox: devbox
	@cd haskellbox && docker build -t $(REPOSITORY)/haskellbox .

fsharpbox: devbox
	@cd fsharpbox && docker build -t $(REPOSITORY)/fsharpbox .

octavebox: devbox
	@cd octavebox && docker build -t $(REPOSITORY)/octavebox .

#Postgres with PLV8
postgres:
	@cd postgres && docker build -t $(REPOSITORY)/postgres .

clean:
	@$(foreach image,$(images),docker rmi --force $(REPOSITORY)/$(image);)

.PHONY: all devbox devbox-no-cache dotfiles home data x11dockerhost postgres clean
