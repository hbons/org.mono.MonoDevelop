#!/bin/bash

# TODO: Add new --force-clean option to xdg-app-builder later
rm -Rf ./app
rm -Rf ./repo
xdg-app --user uninstall org.mono.MonoDevelop
xdg-app --user remote-delete monodevelop

xdg-app-builder --repo=monodevelop.com --gpg-sign=051F66BD app org.mono.MonoDevelop.json
xdg-app --user remote-add --gpg-import=monodevelop.gpg monodevelop ./monodevelop.com/
xdg-app --user install monodevelop org.mono.MonoDevelop

