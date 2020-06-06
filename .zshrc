# Path to your oh-my-zsh installation.
export ZSH=/Users/cain/.oh-my-zsh
export KEYTIMEOUT=1
export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Show current pwd as title
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME=robbyrussell
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_NODE_VERSION_BACKGROUND='28'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='15'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git vi-mode wd docker yarn)

# User configuration

# export PATH="/Users/cain/.nvm/versions/node/v0.12.7/bin:/usr/local/heroku/bin:/Users/cain/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/cain/bin:/Users/cain/git/git-stree:$ANDROID_HOME"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# bind incremental search
bindkey '^r' history-incremental-search-backward

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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

alias gpph="git pull && git push && git push heroku master"
alias gpp="git pull && git push"
alias gpphd="git pull && git push && heroku maintenance:on && sleep 15 && git push heroku master && heroku maintenance:off"
alias gp="git pull"
alias gcpp="git add -A && git commit -v && git push"
alias gcpps="git pull && git add -A && git commit -v && git push"
alias gs="git status"
alias gpb="BRANCH=\`git branch | grep '*' | sed 's/* //'\`; git push -u origin \$BRANCH"
alias gpbnv="BRANCH=\`git branch | grep '*' | sed 's/* //'\`; git push -u origin \$BRANCH --no-verify"
alias gcpb="git add -A && git commit -v && gpb"
alias gcpbnv="git add -A && git commit -v && gpb --no-verify"
alias gcb="git checkout -B"
alias glgrc="unbuffer git for-each-ref --sort=committerdate refs/heads/ refs/remotes/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' | sed s#origin\/##g | uniq"
alias glgr="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %Cblue%cn%Creset' --abbrev-commit --date=relative"
alias gsf="git submodule foreach"
alias gmercer="ssh-add ~/.ssh/id_rsa_adam-bitbucket && ssh-add ~/.ssh/id_rsa"

# Diff color word
alias gddw="git diff --color-words=."

alias psql_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias psql_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias ll='ls -la'

alias swap-keys="mv ~/.config/karabiner/karabiner.json ~/.config/karabiner/temp.json; mv ~/.config/karabiner/karabiner1.json ~/.config/karabiner/karabiner.json; mv ~/.config/karabiner/temp.json ~/.config/karabiner/karabiner1.json;"

alias yarne="yarn --ignore-engines"
alias yarnl="yarne --no-lockfile"
alias reyarnl="rm -rf ./node_modules && yarnl"
alias renpmi="rm -rf ./node_modules && npm i"

# quick weather
alias weather="curl -4 http://wttr.in"

# code insiders shortcut
alias codi="code-insiders"

# Node

# Clear node modules
alias clear_nodemodules="find . -name node_modules -exec rm -rf '{}' +"

# quick webserver
alias webserver="npx browser-sync start --server --files \"*/*\""

# End of aliases

export NVM_DIR="/Users/cain/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export SVN_EDITOR=vim

# export PATH="$HOME/.yarn/bin:$PATH"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
export PATH="/usr/local/sbin:$PATH:/Users/cain/bin"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/cain/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Angular helpers
# usage: ngrxG feature-name

ngrxG() {
  ng generate module $1 --flat false;
  cd $1 && ng generate feature `python -c "print '$1'.title()"` -m $1.module.ts;
  ng g s $1Facade -m $1.module.ts;
  mkdir components; cd components; ng g c $1;
  cd ../..;
}

ngrxGC() {
  ( 
    ng generate module $1 --flat false;
    cd $1 && ng generate feature `python -c "print '$1'.title()"` -m $1.module.ts;
    ng g s $1Controller;
    mkdir components; cd components; ng g c $1;
  )
}

ngrxGR() {
  ng generate module $1 --flat false --routing;
  cd $1 && ng generate feature `python -c "print '$1'.title()"` -m $1.module.ts;
  ng g s $1Facade -m $1.module.ts;
  mkdir components; cd components; ng g c $1;
  cd ../..;
}

ngPage() {
  ng generate module $1 --flat false --routing;
  ( cd $1; ng g c --flat true $1; )
}

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prevent history to dupe for fzf
setopt HIST_IGNORE_ALL_DUPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
