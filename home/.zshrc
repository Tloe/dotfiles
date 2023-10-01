export ZSH="/home/t/.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export JAVA_HOME='/opt/android-studio/jbr'
export PATH="$PATH:/home/t/.local/bin:/home/t/.local/share/gem/ruby/3.0.0/bin:$(go env GOPATH)/bin:/home/t/perl5/bin:/home/t/.local/share/gem/ruby/3.0.0/bin:/home/t/.cargo/bin:/opt/flutter/bin:$JAVA_HOME/bin:/home/t/.platformio/penv/bin"

# PERL ENV
export PERL5LIB="${PERL5LIB}:/home/t/perl5/lib/perl5"
export PERL_LOCAL_LIB_ROOT="${PERL_LOCAL_LIB_ROOT/home/t/perl5}"
export PERL_MB_OPT="--install_base \"/home/t/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/t/perl5"

# History
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000 # How many commands zsh will load to memory.
export SAVEHIST=10000 # How maney commands history will save on file.
setopt HIST_IGNORE_ALL_DUPS # History won't save duplicates.
setopt HIST_FIND_NO_DUPS # History won't show duplicates on search.

# Themes
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

# export FORGIT_NO_ALIASES="true"

# Plugins
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $ZSH/plugins/forgit/forgit.plugin.zsh

export FZF_DEFAULT_OPTS='--ansi --height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_CTRL_T_COMMAND='fd --type file --color=always'
# Enable completion tab selection
zmodload zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
bindkey -M menuselect '^[' clear-screeb

# Fix home,end del keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[^["   kill-whole-line

# Aliases
alias cddd='cd ~/dotfiles'
alias cdd='cd ~/dev'
alias cdp='cd ~/dev/protojour'
alias cdv='cd ~/dotfiles/nvim/.config/nvim'
alias cda='cd ~/dev/protojour/authly-core'
alias cdss='cd ~/dev/skraag/skraag'
alias cdsf='cd ~/dev/skraag/skraag-flutter'
alias cdsw='cd ~/dev/skraag/skraag-web'
alias cdam='cd ~/dev/protojour/authly-core-master'
alias cdm='cd ~/dev/protojour/memoriam'
alias cdt='cd ~/dev/private/TEngine'
alias cdaa='cd ~/dev/Aoa1WinNASM/'
alias l='ls -ll'
alias ll='ls -all'
alias go='/usr/bin/grc go'
alias goproc='ps aux | grep go-build | grep -v grep'
alias cat='bat --paging=never'
alias luamake=/home/t/dev/lua-language-server/3rd/luamake/luamake

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH":"$HOME/.pub-cache/bin"
