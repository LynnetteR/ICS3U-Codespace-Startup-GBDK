#!/bin/bash

# Created by: Mr Coxall
# Created on: Jun 2022
# Created for: To automate the generation of SSH GitHub keys


# this script will setup your SSH key with GitHub
echo "This script will setup your SSH key with GitHub"
echo ""

echo "Please enter your full name (ex: Jane Smith): "
read  name
echo "Please enter your email address that you used to setup GitHub (ex: mr.coxall@mths.ca): "
read  email
echo "Please enter your GitHub user name (ex: mr-coxall): "
read  user

echo ""
echo "You will next be asked 3 questions."
echo "Just press ENTER each time."
echo ""

# setup SSH key
ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub

echo ""
echo "Please copy and paste the above key into your GitHub SSH Keys."
echo "(at: https://github.com/settings/keys)"
echo "Once done, press any key."
read  any_key

echo ""
echo "Next you will be asked if you want to continue"
echo "Type 'yes' ..."
echo "Once done, press any key."
read  any_key

ssh -T git@github.com
git config --global user.email "$email"
git config --global user.name "$name"
git config --global init.defaultBranch main

echo ""
echo "To finish the setup, a new Codespace window will open up."
echo "When it does, close this orginial one and use the new Codespace window."
echo "When ready, press any key."
read  any_key

# create an GBDK directory in the root directory
mkdir ~/GBDK
mkdir ~/GBDK/lesson-01
mkdir ~/GBDK/lesson-02
mkdir ~/GBDK/lesson-03
mkdir ~/GBDK/lesson-04
mkdir ~/GBDK/lesson-05
mkdir ~/GBDK/lesson-06
mkdir ~/GBDK/lesson-07
mkdir ~/GBDK/lesson-08
mkdir ~/GBDK/lesson-09
mkdir ~/GBDK/lesson-10
mkdir ~/GBDK/lesson-11
mkdir ~/GBDK/lesson-12
mkdir ~/GBDK/lesson-13

# copy over the .vscode directory and web tools into it
cp -r .vscode ~/GBDK/.vscode
cp -r ./simulator ~/GBDK/simulator
cp -r ./Tile_Generator ~/GBDK/Tile_Generator
cp -r ./example ~/GBDK/example
cp -r compile.sh ~/GBDK
chmod +x ~/GBDK/compile.sh

# update the .bashrc to add in aliases for ll, ..
cp .bashrc ~/.bashrc

# change into the GBDK directory and then open Codespaces in there
cd ~/GBDK
code .
