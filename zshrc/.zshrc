# zsh
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true

# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' %F{red}•%f'
zstyle ':vcs_info:*' stagedstr ' %F{yellow}+%f'

# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '%b%u%c '
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{green}${vcs_info_msg_0_}%f'

autoload -Uz compinit
compinit

# History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export HISTFILE=~/.zsh_history
export HISTFILESIZE=50000
export HISTSIZE=50000
export SAVEHIST=50000

setopt appendhistory          # append to history file, don't overwrite it
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Customize to your needs...
export PATH=./.bin:$PATH
export PATH=./bin:$PATH
export PATH=~/.bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=${PATH}:~/.local/bin

export EDITOR=nvim

# Git
alias gco='git checkout'
alias gph='git push'
alias gp='git pull'
alias gco'git checkout'
alias gc='git commit'
alias gcm='git commit -m'
alias gb='git branch'
alias gst='git stash'
alias gstp='git stash && git stash pop stash@{1}'
alias gpq='git pull-request'
alias grm='git rm'
alias ga='git add'
alias gaa='git add -A'
alias gd='git diff'
alias gdc='git diff --cached'
alias grmc='git rm -r --cached'
alias gfo='git fetch origin'
alias gphu='gph -u origin'
alias gpha='gph andrewkatz'
alias gpho='gph origin'
alias gpom='gp origin main'
alias gcom='gco main'
alias gcon='gcom; gpom; gco -b'
alias gpod='gp origin development'
alias gcod='gco develop'
alias gcob='gcod && gp && gco -b'
alias rmo='rm **/*.orig'
alias gbd='git branch --merged | grep -v "\*" | grep -v main | xargs -n 1 git branch -d'
alias gbds='git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gpp='gp --rebase && gph'
alias gpbd='gp ; gbd ; gbds'
alias grh='git reset HEAD'
alias gpr='gh pr'
alias ghm='gh pr merge -md --admin ; gp'
alias rw='gh repo view -w'
alias prw='gh pr view -w'
alias prc='gh pr create'
alias lg='lazygit'

alias rs='rails server'
alias rc='rails console'
alias b='bundle'
alias be='bundle exec'
alias fs='foreman start'
alias rdm='rails db:migrate'

alias c="cd"
alias ls="eza"
alias ll="eza -lah"
alias k="kill -9"

alias zrc='nvim ~/.zshrc'
alias reload='exec $SHELL -l'
alias vimrc='vim ~/.vimrc'
alias ovim='/usr/local/bin/vim'
alias vim='nvim'

alias update='~/.bin/update'

alias ssh_core='ssh -i ~/.ssh/liz/portal-dev-or.pem ubuntu@54.70.173.252'
alias ssh_lg_api='ssh -i ~/.ssh/liz/portal-dev-or.pem ubuntu@44.232.21.7'
alias ssh_whitelabel='ssh -i ~/.ssh/liz/portal-dev-or.pem ubuntu@44.232.205.154'
alias ssh_data_tunnel='ssh ubuntu@data.giantpartners.com'
alias ssh_sftp='ssh -i ~/.ssh/liz/portal-dev-or.pem ubuntu@34.209.57.22'

alias t='terraform'
alias ti='terraform init'
alias ta='terraform apply'
alias tp='terraform plan'

d()
{
  cd ~/dev/$1
}
compdef "_files -W \"$HOME/dev\"" d

tmp()
{
  cd ~/tmp/$1
}
compdef "_files -W \"$HOME/tmp\"" tmp

nvimrc()
{
  previous_dir=$(pwd)
  cd ~/.config/nvim
  nvim
  cd $previous_dir
}

ulimit -n 2560

# Direnv
eval "$(direnv hook zsh)"

# Disable AWS pager
export AWS_PAGER=""

# Init rbenv
eval "$(rbenv init -)"

# Init starship
eval "$(starship init zsh)"

# Set underline cursor
echo -ne "\033[4 q"

chpwd() {
  printf '\033]7;file://%s%s\033\\' "$HOST" "$PWD"
}
