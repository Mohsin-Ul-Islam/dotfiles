# Dotfiles

My custom dotfiles for high velocity development workflow.

## Setup

### Fish shell

First install the fish shell from here: https://fishshell.com/

Now create an alias named dotfiles that will use git to manage your dotfiles on the system.

```
alias --save dotfiles git --git-dir=.dotfiles --work-tree=$HOME
```

Init the dotfiles local repository

```
dotfiles init
```

Rename the default branch to main

```
dotfiles branch -m master main
```

Then set the remote

```
dotfiles remote add origin git@github.com:Mohsin-Ul-Islam/dotfiles.git
```

Pull the latest changes

```
dotfiles pull origin main
```

### Tmux

Install the tmux https://github.com/tmux/tmux

### Tmux Plugin Manager

Install the tpm 

```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Now install the tmux plugins by pressing the `Ctrl+B` then `I`

For more information: https://github.com/tmux-plugins/tpm

### Neovim

Install the neovim from https://github.com/neovim/neovim

