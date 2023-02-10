# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  command-not-found
  jira
  nvm
  npm
  web-search
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration
JIRA_URL="https://nowjobs.atlassian.net"
SERVER_PATH="$HOME/NowJobs/server"

# Aliases
alias gcod="git checkout develop"
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gcob="git checkout -b"
alias gfp="git fetch --prune && git status"
alias gpull="git fetch --prune && git pull"

intestFolder () {
  FOLDER=$PWD;
  cd $SERVER_PATH;
  node $SERVER_PATH/node_modules/jest/bin/jest.js --config $SERVER_PATH/jest.integration.config.js --colors --verbose --forceExit --maxWorkers=4 --runTestsByPath $FOLDER/**/*.int.spec.ts

  cd $FOLDER
}

testFolder () {
  FOLDER=$PWD;
  cd $SERVER_PATH;
  node $SERVER_PATH/node_modules/jest/bin/jest.js --config $SERVER_PATH/jest.config.js --colors --verbose --forceExit --maxWorkers=4 --runTestsByPath $FOLDER/**/*.unit.spec.ts

  cd $FOLDER
}

export EDITOR='vim'

source /Users/peterdelvaux/.docker/init-zsh.sh || true # Added by Docker Desktop
