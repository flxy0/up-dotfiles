# Literally nothing in here anyway
# 1se~

export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="foxy"

source $ZSH/oh-my-zsh.sh

# User configuration

alias vim="nvim"
export EDITOR=nvim

alias cl='clear'

alias lock='sh ~/.xlock/lock.sh'

################
# Arch aliases #
################

# Pacman
alias pacupg='sudo pacman -Syu'			# Upgrade packages
alias pacin='sudo pacman -S'				# Install package(s)
alias pacinfile='sudo pacman -U'		# Install package from file
alias pacre='sudo pacman -R'				# Remove package(s)
alias pacrecomp='sudo pacman -Rns'	# Remove package(s) with configs and unneeded dependencies
alias pacinfo='sudo pacman -Si'			# Show information for specified package in the repo
alias pacfind='sudo pacman -Ss'			# Searches for package(s) in the repo
alias pacinfol='sudo pacman -Qi'		# Show information for specified local package
alias pacfindl='sudo pacman -Qs'		# Searches for package(s) locally

# Yaourt
alias yaconf='yaourt -C'						# Fix configuration files
alias yaupg='yaourt -Syua'					# Upgrade packages
alias yaupgrade='yaourt --sucre'		# Upgrade packages without confirmation
alias yain='yaourt -S'							# Install package(s) from AUR
alias yainfile='yaourt -U'					# Install package from file
alias yare='yaourt -R'							# Remove yaourt package(s)
alias yarecomp='yaourt -Rns'				# Remove yaourt package(s) with configs and unneeded dependencies
alias yainfo='yaourt -Si'						# Show information from specified package in the AUR
alias yafind='yaourt -Ss'						# Searches for package(s) in the AUR
alias yainfol='yaourt -Qi'					# Display info for specified local package
alias yafindl='yaourt -Qs'					# Searches for package(s) locally
alias yalist='yaourt -Qe'						# List (all) installed packages
alias yareorph='yaourt -Qtd'				# Remove orphans

###############
# Git aliases #
###############

alias gconf='git config'
alias gconfl='git config --list'

alias g='git'
alias ga='git add'
alias gaa='git add --all'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias grh='git reset --hard'

alias gd='git diff'

alias gpu='git pull'
alias gpush='git push'

alias gst='git status'
