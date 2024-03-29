# dotfiles

Automated dotfiles installer with Ansible (featuring my personal set of dotfiles).

```sh
./install.sh
```

## Featuring

### jpeg-compressor.sh
A handy script to compress a bunch of JPEG files at once.
<p align="center">
  <img src="docs/jpeg-compressor_screenshot.png" alt="jpeg-compressor screenshot">
</p>

### tmux theme
<p align="center">
  <img src="docs/tmux_screenshot.png" alt="A swaggy tmux">
</p>

## How to use it

Start by forking/cloning this repo.

There is 2 things to edit to make this yours:
* Put your dot files and folders in the "[ansible/roles/common-linux/files/home](ansible/roles/common-linux/files/home)" folder
* Define the desired configurations in the ansible playbooks

Then, just execute the script:
```sh
./install.sh
```

## How it works

The install.sh script will start by installing Ansible.

Then it will run the main playbook to:
- apply a set of configurations depending on the platform
- recursively loop into the "ansible/roles/common-linux/files/home" folder. For each file found, a link will be created in the `$HOME` directory, keeping its subdirectory structure.

> **But why a link???**

Putting a link for configuration files instead of copying them, allows to re-run the dotfiles installer without erasing the locally modified configurations.
