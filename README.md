# dotfiles

An automated dotfiles installer (featuring my personal set of dotfiles).

I've done a pretty neat install.sh, so you will be able to use it for your own dotfiles (be aware of what you are doing though).

## How to use it

Start by forking/cloning this repo.

There is only 2 things to edit to make this yours:
* Put your dot files and folders in the "home" folder.
* Optionally, write in pre_intall.sh the commands to execute before installing the dotfiles.

Finally execute the set up script:
```sh
./install.sh
```

## How it works

The install.sh script will start by executing pre_install.sh.

Then it will recursively loop into the local "home" folder.

For each file found, a link will be created in the `$HOME` directory, keeping of course its subdirectory structure.

## What it looks like

<p align="center">
  <img src="docs/screenshot.png" alt="A swaggy tmux">
</p>
