# DISABLE_AUTO_UPDATE=true

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

source $ZSH/oh-my-zsh.sh

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=2000
SAVEHIST=2000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

GIT_AUTO_FETCH_INTERVAL=1200

setopt histreduceblanks

# Don't kill background jobs when I logout
setopt nohup

# Customize to your needs...
export PATH=$HOME/.symfony/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export IBUS_ENABLE_SYNC_MODE=1

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[ -d "$HOME.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"

[ -d "$HOME/virtual_env" ] && export WORKON_HOME=$HOME/virtual_env

[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GATLING_HOME=/opt/gatling
# export SENSIOLABS_ENABLE_NEW_DIRECTORY_STRUCTURE=true
export LC_ALL=fr_FR.UTF-8

# # Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='vim'
#else
#    export EDITOR='mvim'
#fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
