# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISABLE_AUTO_UPDATE=true

source ~/.zsh_plugins.sh

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"

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

# Remove "adds % of end line output"
export PROMPT_EOL_MARK=''

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# export WORKON_HOME=$HOME/virtual_env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GATLING_HOME=/opt/gatling
export SENSIOLABS_ENABLE_NEW_DIRECTORY_STRUCTURE=true
export LC_ALL=fr_FR.UTF-8
export PATH="${PATH}:${HOME}/.krew/bin"

# # Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='vim'
#else
#    export EDITOR='mvim'
#fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.zshrc:

eval "$(pyenv virtualenv-init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
[ -s "${HOME}/.rd" ] && export PATH="${HOME}/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
