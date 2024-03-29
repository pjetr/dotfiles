# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"

plugins=(
  colored-man-pages
  command-not-found
  git
  git-flow
  jira
  k
  macos
  nvm
  npm
  web-search
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
JIRA_URL="https://nowjobs.atlassian.net"
SERVER_PATH="$HOME/NowJobs/server"

# Aliases
alias rebuild="npm run clean && npm ci && npm run build"
alias gcod="git checkout develop"
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gcob="git checkout -b"
alias gfp="git fetch --prune && git status"
alias gpull="git fetch --prune && git pull"
alias gmd="git fetch --prune && git merge origin/develop"
alias gbranch="git branch --show-current | pbcopy"
alias jiraCurrent="jira \$(git branch --show-current | grep -o -E \"[A-Z]+\-\d+\")"

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
iPull () {
  docker pull registry.gitlab.com/nowjobs/backoffice/develop
  docker pull registry.gitlab.com/nowjobs/desktop-app/develop
  docker pull registry.gitlab.com/nowjobs/mobile-app/develop

  FOLDER=$PWD;

  cd $SERVER_PATH
  docker-compose up -d --force-recreate backoffice mobile desktop

  cd $FOLDER
}

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
