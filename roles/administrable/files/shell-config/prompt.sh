# Color definition
FONT_BOLD='\e[1m\]'
FONT_RESET='\e[0m\]'
COLOR_GREEN='\e[0;92m\]'
COLOR_BLUE='\e[0;94m\]'
COLOR_RED='\e[0;91m\]'
COLOR_RESET='\e[0;39m\]'

ps1() {
  # Check the exit code of the previous command and display different
  # colors in the prompt accordingly.
  if [ $? -eq 0 ]; then
    local status="${COLOR_GREEN}√${COLOR_RESET}"
  else
    local status="${COLOR_RED}🕱${COLOR_RESET}"
  fi

  ## Detect if user is an administrator (root or any sudoer)
  ([ "`id -u`" -eq 0 ] || $(sudo -vn && sudo -ln 2>&1 | grep -v 'may not' > /dev/null)) \
    && IS_ADMIN=1 \
    || IS_ADMIN=0

  if [ $IS_ADMIN -eq 1 ]; then
    local user="${COLOR_RED}\u${COLOR_RESET}"
  else
    local user="${COLOR_GREEN}\u${COLOR_RESET}"
  fi

  local host="@${COLOR_GREEN}\h${COLOR_RESET}"
  local cwd="${COLOR_BLUE}\w${COLOR_RESET}"

  PS1="[${status}] ${FONT_BOLD}${user}${host}:${FONT_RESET}${cwd} \n\$ "
}

export PROMPT_DIRTRIM=3
export PROMPT_COMMAND="ps1${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
