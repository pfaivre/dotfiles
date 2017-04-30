# dotfiles

An automated dotfiles installer (featuring my personal set of dotfiles).

I've done a pretty neat install.sh, so you will be able to use it for your own dotfiles without dirty hack.

## How to use it

Start by forking this repo.

There is only 2 things to edit to make this yours:
* Put your dot files and folders in the "home" folder.
* In pre_intall.sh, write the commands to execute before installing the dofiles. Or leave it empty.

Finally execute the set up script:
```sh
./install.sh
```

## How it works

The install.sh script will start by executing pre_install.sh.

Then it will recursively loop into the local "home" folder.

For each file found, a link will be created in the `$HOME` directory, keeping of course its subdirectory strucure.


