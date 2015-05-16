HISTFILE=~/.zsh_hist
HISTSIZE=100000
SAVEHIST=100000

bindkey -e
setopt extendedglob
setopt interactivecomments
setopt prompt_subst
unsetopt beep
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zstyle ':completion:*' menu select

# Map Ctrl+Arrows to move forward/backward by word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

# Automatically determine escape sequences (control codes) for easier key-binding
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
key[BackSpace]=${terminfo[kbs]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
# Setup keybinds for smart history searching and intuitive backspace behaviour
[ -n "${key[Up]}"        ] && bindkey "${key[Up]}"        up-line-or-beginning-search   || echo 'Something went wrong with keybinding "Up"'
[ -n "${key[Down]}"      ] && bindkey "${key[Down]}"      down-line-or-beginning-search || echo 'Something went wrong with keybinding "Down"'
[ -n "${key[Delete]}"    ] && bindkey "${key[Delete]}"    delete-char                   || echo 'Something went wrong with keybinding "Delete"'
[ -n "${key[BackSpace]}" ] && bindkey "${key[BackSpace]}" backward-delete-char          || echo 'Something went wrong with keybinding "BackSpace"'
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Setup prompt
# Set prompt color to red when using SSH, yellow when local root, and green when local user
if [ "${UID}" -eq 0 ]; then
  local_prompt_color=yellow
else
  local_prompt_color=green
fi
if [ -n "${SSH_CLIENT}" ];then
  prompt_color=red
else
  prompt_color=${local_prompt_color}
fi
# Git integration
zstyle ':vcs_info:*' stagedstr 'M' 
zstyle ':vcs_info:*' unstagedstr 'M' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
  if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) = 'true' ] && \
  [ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') -eq 1 ] ; then
  hook_com[unstaged]+='%F{1}??%f'
fi
}
precmd () { vcs_info }
PROMPT='%F{cyan}[ %~ ]
%F{$prompt_color}%n@%m ${vcs_info_msg_0_}%(!.#.$) %f'

# TMUX (attach to existing session, or start new)
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# ZSH Syntax Highlighting Plugin
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='ls --color'
alias diff='colordiff'
alias lsblka='lsblk -o NAME,TYPE,FSTYPE,LABEL,SIZE,UUID,MOUNTPOINT'
