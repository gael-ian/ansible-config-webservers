# Bash default options
# Inspired by Sensible Bash <https://github.com/mrzool/bash-sensible>


## GENERAL OPTIONS ##

# Update window size after every command
shopt -s checkwinsize


## GLOBBING ##

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;


## SMARTER TAB-COMPLETION ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"
# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"
# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"
# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"


## HISTORY ##

# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Record each line as it gets issued
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;}history -a"
# Keep a huge history
HISTSIZE=500000
HISTFILESIZE=100000
# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"
# Use standard ISO 8601 timestamp
HISTTIMEFORMAT='%F %T '
# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
# Enable incremental history search with up/down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space


## DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null
