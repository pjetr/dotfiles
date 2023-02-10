# Peter's dotfiles

## Before you start
I use a couple of tools that you will need to install to replicate my setup.

* [Vundle](https://github.com/VundleVim/Vundle.vim) is a tool to manage VIM plugins
* [Oh-My-Zsh](https://ohmyz.sh/) is a delightful & open source framework for Zsh
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) a plugin for zsh
* [zsh-completions](https://github.com/zsh-users/zsh-completions) a plugin for zsh

## How to install
Once you've installed all tools listed before, you can either checkout this repo, or you can simply copy-paste the files into the correct location.

### Oh-My-Zsh
To copy my zshrc to the correct location, open a terminal from where you have checked out this repo and run the following commands.

```bash
mv ~/.zshrc ~/.zshrc.bak
cp ./zshrc ~/.zshrc
```

* First, this will move (`mv`) your existing `.zshrc` file to `.zshrc.bak` or just keep a backup of the existing setup.
* Second will copy (`cp`) my file in the correct location.

### vim
Vim can be daunting, but is so much more powerful than nano, and above all it's easy to make it look better than nano. So if you followed the steps to install Vundle, just follow these simple steps to install my setup.

```bash
mv ~/.vimrc ~/.vimrc.bak
cp ./vimrc ~/.vimrc
vim +PluginInstall +qall
```

* First, this will move (`mv`) your existing `.vimrc` file to `.vimrc.bak` or just keep a backup of the existing setup.
* Second will copy (`cp`) my file in the correct location.
* Last will install all plugins, and allow you to have the exact same setup as I do.

## What now?

### Pick a theme
Take a look at [oh-my-zsh themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes), and see if there's one that you like better. I liked [candy](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#candy) for it's simplicity. 


### Add plugins
Take a look at [oh-my-zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins), thise are the ones I installed: 

* [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages): It, uhm, adds color to man pages
* [command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found): This suggests how to install packages that you don't yet have on your system
* [jira](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jira): Open a ticket from your terminal
* [nvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm): Installs nvm
* [npm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm): add useful aliases
* [web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search): allows you to search the internet. 
* [zsh-autosuggestions](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-autosuggestions): adds auto suggestions
* [zsh-completions](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-completions): adds autocompletions

### Use the aliases

* `gcod`: **git checkout develop**
* `gcom`: **git checkout master**
* `gcos`: **git checkout staging**
* `gfp`: **git fetch --prune && git status**
* `gpull`: **git fetch --prune && git pull**
* `gcob`: **git checkout branch**

To use the last one you can use for instance: `gcob feature/NOW-15` to start a branch form where you were named `feature/NOW-15`

### testFolder and intestFolder
These are NowJobs specific, to use these, you'll need to update the variable `SERVER_PATH` to wherever you have cloned the server repo to. When you take your terminal and go into a folder in which you want to run all the tests, for instance all integration tests for api v1:

```bash
cd $SERVER_PATH/src/api/v1
intestFolder
```

Or if you want to run all unit tests in the domains:
```bash
cd $SERVER_PATH/src/domains
testFolder
```

You can go as deep as you want in the folder structure, it will find all tests within that folder and run them.