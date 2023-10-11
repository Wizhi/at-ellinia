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

# Current annoyances

It seems like autocomplete is broken for the `dotfiles` alias, which really sucks.

[tracking]: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
