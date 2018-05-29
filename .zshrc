#Config Powerline
POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir rbenv virtualenv vcs)
POWERLEVEL9K_VIRTUALENV_BACKGROUND='green'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_FOREGROUND='blue'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
#POWERLEVEL9K_VCS_HIDE_TAGS=true

if [ `hostname -f` = '???' ]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir rbenv virtualenv vcs)
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
#
# User configuration sourced by interactive shells
#
# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux: server" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}
#if [ '`hostname`' == 'ansible host' ]; then
#    export ANSIBLE_PRIVATE_KEY_FILE=~/.ssh/id_rsa_auto-it
#    export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_vault/vaultpass
#    export ANSIBLE_STDOUT_CALLBACK=actionable
#fi
#

#configure HH
export HISTFILE="$HOME/.bash_history.`hostname`"
alias hh='$HOME/local/bin/hh'
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

alias tmux=$HOME/local/bin/tmux
alias grep='grep --color'
alias wget='wget --no-check-certificate'
