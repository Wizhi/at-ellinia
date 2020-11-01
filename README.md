# Installation

[This repository is tracking my home directory using a bare repository.][tracking]

`git-lfs` is used to track "larger" files, such as fonts.

Assuming that `git` and `git-lfs` is already installed, the following should do the trick:

```bash
$ alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME" 
$ git clone --bare https://www.github.com/wizhi/dotfiles $HOME/.dotfiles
$ dotfiles checkout
$ dotfiles submodule update --init --recursive
$ dotfiles lfs install
$ dotfiles lfs pull
```

The `dotfiles checkout` will copy all dotfiles into `$HOME`, and will fail if any of these already exists.
If this happens, the only fix is to backup the existing files and `dotfiles checkout` again.

To use `zsh`, simply create a symbolic link for `.zshenv`, and it will bootstrap itself.

```bash
$ ln -s $HOME/.zshenv $HOME/.config/zsh/.zshenv
```

# Current annoyances

It seems like autocomplete is broken for the `dotfiles` alias, which really sucks.

# Things to look into

* How to handle differing configurations between machines

# Improvements

1. Move zsh configuration to own repository
2. Move neovim configuration to own repository

[tracking]: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
