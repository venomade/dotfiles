autoload -U compinit
compinit

setopt COMPLETE_IN_WORD

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# ZSH_Unplugged Plugin Manager
function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

repos=(
	Aloxaf/fzf-tab
	zdharma-continuum/fast-syntax-highlighting
	joshskidmore/zsh-fzf-history-search
	jackharrisonsherlock/common
)

plugin-load $repos

# Plugin Configs
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Path
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ec=emacsclient -t

[ -f "/home/venomade/.ghcup/env" ] && . "/home/venomade/.ghcup/env" # ghcup-env