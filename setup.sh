#!/bin/bash

echo "Install packages"
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y \
	seclists \


echo "Initialize msfdb"
sudo msfdb init

echo "Update searchsploit"
sudo searchsploit -u

echo "Install bazel"
sudo apt install curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel

echo "Set up gtile"
git clone https://github.com/gTile/gTile.git /tmp/gTile
cd /tmp/gTile
bazel run :install-extension

echo "Reload gnome shell: Alt+F2 -> r -> [enter]"
