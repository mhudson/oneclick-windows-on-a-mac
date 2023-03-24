#!/bin/sh

echo "Checking pre-requisites"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update

brew install --cask microsoft-remote-desktop
brew install virtualbox
brew install vagrant

vagrant plugin install vagrant-vbguest
vagrant up

# RDP connection. Username/Password: vagrant/vagrant
open "vagrant.rdp"