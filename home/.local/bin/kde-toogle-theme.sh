#!/bin/bash

# == Parameters ===============================

light_theme="BreezeLight"
dark_theme="BreezeDark"

l10n_scheme_grep="Thème courant"

# =============================================


if [[ $1 = "dark" ]]; then
    plasma-apply-colorscheme $dark_theme
    exit 0
elif [[ $1 = "light" ]]; then
    plasma-apply-colorscheme $light_theme
    exit 0
fi


CUR_SCHEME=$(plasma-apply-colorscheme --list-schemes | grep "$l10n_scheme_grep")

if [[ "$CUR_SCHEME" =~ "$light_theme" ]]; then
    plasma-apply-colorscheme "$dark_theme"
    # /usr/lib/x86_64-linux-gnu/libexec/plasma-changeicons breeze-dark
else
    plasma-apply-colorscheme "$light_theme"
    # /usr/lib/x86_64-linux-gnu/libexec/plasma-changeicons breeze
fi
