# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/aditya/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(github git vim vi-mode fedora yum python nmap)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nml="nmap localhost"
alias dotup="~/Scripts/updaterepos.sh"
alias nmwifi="nmcli device wifi connect"
alias nmlist="nmcli device wifi list"
alias mkscript="~/Scripts/mkscript.sh"

eval $(thefuck --alias)

# User functions
# Change the DNS to use Google's or Cloudflare's
function chdns {

        if [[ -z $1 ]] || [[ -n $2 ]]; then

                echo "Usage: chdns [OPTION]"
                echo "Options:"
                echo -e "\tg|google - Set Google DNS"
                echo -e "\tc|cloudflare - Set Cloudflare DNS"
                echo -e "\to|opendns - Set OpenDNS DNS"
                echo -e "\tn|norton - Set Norton Netconnect DNS"

        elif [[ -n $1 ]]; then
        
                if [[ "$1" == "g" ]] || [[ "$1" == "google" ]]; then
                        nmcli device modify wlo1 ipv4.dns 8.8.8.8,8.8.4.4
                elif [[ "$1" == "c" ]] || [[ "$1" == "clouflare" ]]; then
                        nmcli device modify wlo1 ipv4.dns 1.1.1.1,1.0.0.1
                elif [[ "$1" == "o" ]] || [[ "$1" == "opendns" ]]; then
                        nmcli device modify wlo1 ipv4.dns 208.67.222.222,208.67.220.220
                elif [[ "$1" == "n" ]] || [[ "$1" == "norton" ]]; then
                        nmcli device modify wlo1 ipv4.dns 199.85.126.10,199.85.127.10
                else
                        echo "Error: Choose a valid option"     
                fi

        fi
}

# load completions
if [[ -d $HOME/.config/completions ]]; then
  completion_scripts=$(ls $HOME/.config/completions)
  for i in ${completion_scripts[@]}; do
    . $HOME/.config/completions/$i
  done
fi
