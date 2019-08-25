# Install core xcode
xcode-select --install

echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
    postgresql
    python3
    python
    tree
    wget
    vim
    git
    zsh
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


CASKS=(
    google-chrome
    google-drive-file-stream
    sublime-text
    spectacle
    trello-x
    iterm2
	slack
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
        psycopg2-binary
        oauth2client
        google-api-python-client
        pandas
        python-dateutil
        google
        google-api-core
        pandas-gbq==0.10.0
        requests-oauthlib
        atlassian-python-api==1.13.5
)
sudo pip install ${PYTHON_PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

echo "Installing /.bash_profile"

echo "
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH 

# Util Scripts


# HISTORY FILE SETTINGS	
export HISTIGNORE='ls:ps:history'  					# Ignore thes commands in History File
HISTTIMEFORMAT='%h %d %H:%M:%S'						# Add timestamp information to history file
PROMPT_COMMAND='history -a' 						# Save Command instantly, instead after successful session
HISTCONTROL=ignoreboth								# Dont duplicate lines or lines starting with space in the history.
 								# Append commands to History instead of overwrite
HISTFILESIZE=20000 									# History file size
HISTSIZE=10000 										# History command length
									# Store multi-line commands as single line

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR='subl -w'” "| sudo tee -a filename >  ~/.bash_profile

. ~/.bash_profile && echo "sourced .bash_profile"

echo "Installing /.bash_aliases"

echo "

# Alias Defintion File

# Directory Shortcuts
alias air='cd ~/code/airflow'
alias ah='cd ~/code/aroundhome'
alias dags='cd ~/code/dags'
alias code='cd ~/code/'
alias home='cd ~/'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias play='cd ~/code/playground'
alias utils='cd ~/code/utils'

# Nav Shortcuts
alias .....='cd ../../../../'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ../'

# Quick-Commands
alias vpn='cd ~/ && sudo openvpn client.ovpn'
alias update='pip install --upgrade .'
alias ezsh='sudo subl ~/.zshrc'
alias szsh='source ~/.zshrc'
alias ea='sudo subl ~/.bash_aliases'
alias sa='source ~/.bash_aliases'
alias spin='. venv/bin/activate'
alias dspin='deactivate'
alias history='history -E'
alias jup='jupyter notebook'

# Command Shortcuts & Enhancements
# sleep 10; alert
alias la='ls -A'                            # List all files
alias l='ls -CF'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias c='clear'

# Git Shortcuts
alias commit='git commit -m'
alias clone='git clone'
alias gc='git checkout'
alias pull='git pull'
alias push='git push'
alias gs='git status'
alias stash='git stash'
alias unstash='git stash pop'
alias nbranch='git checkout -b'
alias pbranch='git push -u origin'


# Airflow Shortcuts
alias aweb='. venv/bin/activate && airflow webserver'
alias sch='. venv/bin/activate && airflow scheduler'


 "| sudo tee -a filename >  ~/.bash_aliases

source ~/.bash_aliases && echo "source /.bash_aliases"

echo "Installing /.zshrc"

echo "
# Path to your oh-my-zsh installation.
				# ZSH Home
export UPDATE_ZSH_DAYS=30							# Update Cycle
export LANG=en_US.UTF-8								# System Lanaguage

ZSH_THEME=random
ZSH_THEME_RANDOM_CANDIDATES=( 'robbyrussell' 'agnoster' )

# HISTORY FILE SETTINGS	
						# Save Command instantly, instead after successful session
							# Don't duplicate lines or lines starting with space in the history.
								# Append commands to History instead of overwrite
HISTFILESIZE=20000 									# History file size
HISTSIZE=10000 										# History command length
 									# Store multi-line commands as single line

# Terminal Behaviour
HYPHEN_INSENSITIVE="true"			# Make - & _ Interchangeable
ENABLE_CORRECTION="true"			# Enable Auto-Correction
COMPLETION_WAITING_DOTS="true"		# Completion Waiting Dots

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/code/utils/aliases.zsh
source ~/.oh-my-zsh/custom/aliases.zsh

# Plugin Configuration

plugins=(git)

 "| sudo tee -a filename >  ~/.zshrc

source ~/.zshrc && echo "Sourced ~/.zshrc"

echo "Installing ~/.oh-my-zsh/custom/aliases.zsh"

echo "

# Alias Defintion File

# Directory Shortcuts
alias play='cd ~/code/playground'
alias stor='cd ~/Volumes/Storage'
alias infarm='cd ~/code/infarm'
alias ah='cd ~/code/aroundhome'
alias utils='cd ~/code/utils'
alias air='cd ~/code/airflow'
alias dags='cd ~/code/dags'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias desk='cd ~/Desktop'
alias code='cd ~/code/'
alias home='cd ~/'



# Nav Shortcuts
alias ......='cd ../../../../../'
alias .....='cd ../../../../'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ../'

# Quick-Commands
alias vpn='cd ~/ && sudo openvpn client.ovpn'
alias update='pip install --upgrade .'
alias ezsh='subl ~/.zshrc'
alias szsh='source ~/.zshrc'
alias ea='subl ~/.oh-my-zsh/custom/aliases.zsh'
alias sa='source ~/.oh-my-zsh/custom/aliases.zsh'
alias spin='. venv/bin/activate'
alias dspin='deactivate'
alias history='history -E'
alias jup='jupyter notebook'

# Command Shortcuts & Enhancements
# sleep 10; alert
alias la='ls -A'                            # List all files
alias l='ls -CF'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias c='clear'

# Git Shortcuts
alias commit='git commit -m'
alias clone='git clone'
alias gc='git checkout'
alias pull='git pull'
alias push='git push'
alias gs='git status'
alias stash='git stash'
alias unstash='git stash pop'
alias nbranch='git checkout -b'
alias pbranch='git push -u origin'


# Airflow Shortcuts
alias aweb='. venv/bin/activate && airflow webserver'
alias sch='. venv/bin/activate && airflow scheduler'


 "| sudo tee -a filename >  ~/.oh-my-zsh/custom/aliases.zsh

source ~/.oh-my-zsh/custom/aliases.zsh && echo "sourced aliases.zsh"


echo "Configuring OSX..."

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

cd ~/
mkdir code
mkdir code/infarm
mkdir code/airflow
mkdir code/dags
mkdir code/utils
mkdir code/playground

echo "Bootstrapping complete"
