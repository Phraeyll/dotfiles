# dotfiles
* Config files for most used applications across systems
* Primary: zsh, vim, tmux, irb, urxvt
* Secondary: .config/awesome, .conkyrc (specific to desktops)

## TODO:
* ~~.xbindkeysrc~~
  * Keybindings are specific to distro, and not necessary for most environments, ie, terminal only
* Cleanup vimrc - possibly split into modular files and source them
* ~~Cleanup zshrc~~
  * Better - Can always be improved
* ~~Read awesome man pages - Customize~~
  * Back to XFCE for the forseeable future
* ~~Read urxvt man pages - Customize~~
  * Added keybindings and options I should need
* ~~Pimp conkyrc~~
  * Edited to my liking - may want to look at a way to have multiple styles

## .zshrc

### Misc Options (Sane Defaults)
* Default history filepath
* Longer History (probably too long)
* Interactive Comments (typing "#" in interactive shell)
* Disables Beep
* Enables colors

### Keybindings
* Default eMacs Keybindings (ctrl + arrow keys, ctrl + a, ctrl +e, etc.) (haven't gotten used to vim mode in a shell)
* Autodetect most keys for keybindings (arrow keys, delete, etc.)
* Menu based tab completion
* Uses up/down arrow keys for searching history based on input
  * For example, "vim ~/.zsh" will bring up "vim ~/.zshrc" if found, rather than the last command typed
* Edit multiline history, such as heredoc, with "ctrl +x +e"

### PROMPT
* Git integration using vcs_info, git rev-parse, and git ls-files
* Prompt color based on UID & local vs ssh session
  * Yellow => Local ROOT
  * Green => Local user
  * RED => SSH (root || non-root)
    * May want to change to something like "orange" for ssh non-root

### Aliases
* Currently using GNU/Linux options for most commands
  * TODO => Change aliases to references environment variables, and use local zshenv to determine default for different distros
    * Eg., alias ls='ls $MY_LS_COLOR_OPT' with MY_LS_COLOR_OPT set to "--color" on linux, and "-G" on FreeBSD (openbsd as well?); also lsblk is only available on linux - FreeBSD uses geom and openbsd uses something else I believe
