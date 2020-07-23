# Installation

[This repository is tracking my home directory using a bare repository.][tracking]

`git-lfs` is used to track "larger" files, such as fonts.

Assuming that `git` and `git-lfs` is already installed, the following should do the trick:

```bash
$ alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME" 
$ git clone --bare https://www.github.com/wizhi/dotfiles $HOME/.dotfiles
$ dotfiles checkout
$ dotfiles lfs install
$ dotfiles lfs pull
```

The `dotfiles checkout` will copy all dotfiles into `$HOME`, and will fail if any of these already exists.
If this happens, the only fix is to backup the existing file and `dotfiles checkout` again.

**Note:** [I've added a `.gitignore`][gitignore], which comes with a few benefits:

1. No chance of accidental `git clean` mistakes.
2. Requires that new files be forcefully added, which I consider a security feature.

This comes at the cost of possibly messing up programs which respect `.gitignore` rules, but that should be dealt with
as it becomes necessary.

# Current annoyances

It seems like `fish` autocomplete is broken for the `dotfiles` alias, which really sucks.
I'm guessing this is due to the `.gitignore` rule.

# Things to look into

* How to handle differing configurations between machines

[tracking]: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
[gitignore]: https://github.com/Wizhi/dotfiles/commit/f2438000ee00cb6d7f50ea3cf978cca261c94723
