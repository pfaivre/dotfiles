#!/bin/bash

CUR_SCHEME=$(plasma-apply-colorscheme --list-schemes | grep "Thème courant")

if [[ $CUR_SCHEME =~ "BreezeLight" ]]; then
    plasma-apply-colorscheme Otto
    #/usr/lib/x86_64-linux-gnu/libexec/plasma-changeicons breeze-dark
else
    plasma-apply-colorscheme BreezeLight
    #/usr/lib/x86_64-linux-gnu/libexec/plasma-changeicons breeze
fi 
