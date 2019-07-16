#!/bin/bash
#===============================================================================
#
#          FILE:  ansible-install-windows-10-wsl.sh
#
#         USAGE:  ./ansible-install-windows-10-wsl.sh
#
#   DESCRIPTION:  Install lastest releases of Ansible via oficial Ubuntu PPA on
#                 a Windows 10 via Windows Subsystem for Linux (WSL)
#
#       OPTIONS:
#
#  REQUIREMENTS:  OS: Windows 10+ (Windows Subsystem for Linux (WSL)
#                 WSL OS: Ubuntu Linux
#          BUGS:  ---
#          TODO:  ---
#         NOTES:  See https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
#                 See https://launchpad.net/~ansible/+archive/ubuntu/ansible
#                 See https://docs.microsoft.com/windows/wsl/about
#        AUTHOR:  Emerson Rocha <rocha(at)ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2019-07-16 01:44 BRT
#      REVISION:  ---
#===============================================================================

sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
