# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(colored-man-pages copyfile copypath dirhistory fzf git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>>>>> Setup Python user base binary directory
export PATH="$HOME/.local/bin:$PATH"

# >>>>>> Setup Rust
export PATH="$HOME/.cargo/bin:$PATH"

# >>>>>> Setup PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# >>>>>> Setup Swift
export PATH="/opt/homebrew/opt/swift/bin:$PATH"

# >>>>>> Setup OpenJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Make all GNU flavor commands available, may override same-name BSD flavor commands
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"

# >>>>>> Setup GNU grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# >>>>>> Setup GNU sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# >>>>>> Setup GNU awk
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"

# >>>>>> Setup broot
source /Users/tafara/.config/broot/launcher/bash/br

# >>>>>> Setup thefuck
eval $(thefuck --alias)

# >>>>>> Setup fzf
source <(fzf --zsh)

# >>>>>> Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --bind 'shift-up:preview-page-up'
  --bind 'shift-down:preview-page-down'
  --style full
  --height -3"

# >>>>>> Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# >>>>>> Setup tuitube
export PATH=/Users/tafara/.termcast/compiled/tuitube/bin:$PATH
