# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export JAVA_HOME=$(/usr/libexec/java_home)
#eval $(docker-machine env default)
#export APP_HOSTNAME=dockerhost
#export ZSH_TMUX_AUTOSTART=true
export ANDROID_HOME=/usr/local/opt/android-sdk
export GRADLE_HOME=/usr/local/bin/gradle
export HOST_IP=$(ipconfig getifaddr en0)
export MONO_GAC_PREFIX="/usr/local"
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
#export HOST_IP=localhost

# 10ms for key sequences
KEYTIMEOUT=1

skip_global_compinit=1

#eval `ssh-agent -s`
#ssh-add ~/.ssh/id_rsa

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux docker)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

#alias node='node --harmony'
alias emacs='emacsclient -nw -c -a ""'
alias killemacs='emacsclient -e "(kill-emacs)"'

#CTRL-S makes vim unresponsive (until CTRL-Q is pressed), this option removes those bindings
stty -ixon

#[ -s "/home/devuser/.k/kvm/kvm.sh" ] && . "/home/devuser/.k/kvm/kvm.sh" # Load kvm

set -o emacs

if [ -f ~/work/docker-scripts.sh ];
then
  source ~/work/docker-scripts.sh
fi

man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

findport() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

flushdns() {
  sudo killall -HUP mDNSResponder
}

fixhostname() {
  scutil --set HostName "localhost"
}

rmiuntagged() {
  docker rmi $(docker images -q --filter "dangling=true")
}

manageDockerVolumes() {
  docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
}

lsVmRoot() {
  docker run --rm -it -v /:/vm-root alpine:edge ls -l /vm-root$1
}

#fortune -s computers | cowsay -f small | lolcat
#autoload -U bashcompinit
#bashcompinit
#eval "$(bash-complete setup)"

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#export WORKON_HOME=$HOME/.virtualenvs
#pyenv virtualenvwrapper_lazy
