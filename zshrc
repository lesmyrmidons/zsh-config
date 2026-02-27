# You can change the names/locations of these if you prefer.
antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    # Lazy-load antidote.
    fpath+=(${ZDOTDIR:-~}/.antidote)
    autoload -Uz $fpath[-1]/antidote
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle <$plugins_txt >$static_file
  )
fi

export ZSH=$HOME/.cache/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh
export ZSH_CACHE_DIR=$ZSH/cache

[ ! -d "$ZSH_CACHE_DIR/completions" ] && mkdir -p $ZSH_CACHE_DIR/completions

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

#autoload -Uz promptinit && promptinit


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=15000
SAVEHIST=15000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
source $(antidote path romkatv/powerlevel10k)/powerlevel10k.zsh-theme

GIT_AUTO_FETCH_INTERVAL=1200

setopt histreduceblanks

# Don't kill background jobs when I logout
setopt nohup

# Customize to your needs...
export PATH=$HOME/.symfony/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export IBUS_ENABLE_SYNC_MODE=1

# Remove "adds % of end line output"
export PROMPT_EOL_MARK=''

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
# Loads aliases specific to the installed environment
if [ -f ~/.zsh_custom ]; then
    . ~/.zsh_custom
fi

if [ -f $HOME/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "/usr/share/nvm/init-nvm.sh" ] && . "/usr/share/nvm/init-nvm.sh"
fi
export GATLING_HOME=/opt/gatling
export LC_ALL=fr_FR.UTF-8
export PATH="${PATH}:${HOME}/.krew/bin"

export BW_SESSION="tj8RrKaZ8X2nHOMwW4ljedBFqjUVq/WxeNKBiMpim6mNt3aywn0rRvSMDak0aggRjthQzKr7hoB1Nl5B8D3srg=="
# # Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='vim'
#else
#    export EDITOR='mvim'
#fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ "$(command -v pyenv)" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
[ -s "${HOME}/.rd" ] && export PATH="${HOME}/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# source the static plugins file
source $static_file

# cleanup
unset antidote_dir plugins_txt static_fileexport

PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/.setup/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/.setup/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/.setup/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/.setup/google-cloud-sdk/completion.zsh.inc"; fi

