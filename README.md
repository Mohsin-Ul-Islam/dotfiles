# Dotfiles

My custom dotfiles for high velocity development workflow.

## Setup

### Fish shell

First install the fish shell from here: https://fishshell.com/

Now create an alias named dotfiles that will use git to manage your dotfiles on the system.

### Fisher

Now install the fish plugin manager

```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Now setup the dotfiles repository

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

Set the config to not show untracked files

```
dotfiles config --local status.showUntrackedFiles no
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

Install the tpm (tmux plugin manager)

```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Now install the tmux plugins by pressing the `Ctrl+B` then `I`

For more information: https://github.com/tmux-plugins/tpm

### FZF

For using the tmux sessionizer script, install `fzf`

```
sudo apt install fzf
```

### Neovim

Install the neovim from https://github.com/neovim/neovim

