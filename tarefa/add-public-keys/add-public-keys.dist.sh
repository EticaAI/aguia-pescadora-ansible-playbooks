#!/bin/bash
#===============================================================================
#
#          FILE:  add-public-keys.dist.sh
#
#         USAGE:  cp add-public-keys.dist.sh add-public-keys.sh
#                 vi add-public-keys.sh
#                 ./add-public-keys.sh
#
#   DESCRIPTION:  Shell script to, based on a hardcored password, add public
#                 keys to all target servers without human intervention to
#                 accept if is first time login.
#                 Already will try to remove previous fingerprint from server
#                 to avoid the warnings.
#
#       OPTIONS:  Password          : "PASSWORD"
#                 Public Key to add : "~/.ssh/id_rsa.pub"
#                 User              : "root"
#                 Server1           : "EXAMPLE.COM"
#                 Server2           : "EXAMPLE.ORG"
#                 Server3...
#                 Server4...
#
#  REQUIREMENTS:  sshpass
#                 ssh-copy-id
#          BUGS:  ---
#          TODO:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha(at)ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2019-07-15 23:36 BRT
#      REVISION:  ---
#===============================================================================

### Server 1 ___________________________________________________________________

ssh-keygen -R EXAMPLE.COM
ssh-keyscan EXAMPLE.COM >> ~/.ssh/known_hosts
sshpass -p PASSWORD ssh-copy-id -i ~/.ssh/id_rsa.pub root@EXAMPLE.COM
# sshpass -p PASSWORD ssh-copy-id -i ~/.ssh/id_rsa_otherkey.pub root@EXAMPLE.COM
# sshpass -p PASSWORD ssh root@EXAMPLE.COM "echo 'ssh-rsa ABCFG.........Z== otherkey@EXAMPLE.COM' | tee -a ~/.ssh/authorized_keys"

### Server 2 ___________________________________________________________________

ssh-keygen -R EXAMPLE.ORG
ssh-keyscan  EXAMPLE.ORG >> ~/.ssh/known_hosts
sshpass -p PASSWORD ssh-copy-id -i ~/.ssh/id_rsa.pub root@EXAMPLE.ORG
# sshpass -p PASSWORD ssh-copy-id -i ~/.ssh/id_rsa_otherkey.pub root@EXAMPLE.ORG
# sshpass -p PASSWORD ssh root@EXAMPLE.ORG "echo 'ssh-rsa ABCFG.........Z== otherkey@EXAMPLE.ORG' | tee -a ~/.ssh/authorized_keys"

### Server 3 ___________________________________________________________________
### Server 4 ___________________________________________________________________
### Server N ...
