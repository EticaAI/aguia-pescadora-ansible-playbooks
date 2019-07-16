
#!/bin/bash
#===============================================================================
#
#          FILE:  add-public-keys.dist.sh
#
#         USAGE:  cp add-public-keys.dist.sh add-public-keys.sh
#                 vi add-public-keys.sh
#                 ./add-public-keys.sh
#
#   DESCRIPTION:  
#
#       OPTIONS:  ---
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
## Variaveis para customizar:
## Servidor remoto:       example.com
## Senha root:            RootPasswordExampleCom
## (opcional) publickey:  ~/.ssh/id_rsa.pub

ssh-keygen -R example.com
ssh-keyscan  example.com >> ~/.ssh/known_hosts
sshpass -p RootPasswordExampleCom ssh-copy-id -i ~/.ssh/id_rsa.pub root@example.com
# sshpass -p RootPasswordExampleCom ssh root@example.com "echo 'ssh-rsa ABCFG.........Z== otherkey@example.com' | tee -a ~/.ssh/authorized_keys"

### Server 2 ___________________________________________________________________
## Variaveis para customizar:
## Servidor remoto:       example.org
## Senha root:            RootPasswordExampleOrg
## (opcional) publickey:  ~/.ssh/id_rsa.pub

ssh-keygen -R example.org
ssh-keyscan  example.org >> ~/.ssh/known_hosts
sshpass -p RootPasswordExampleCom ssh-copy-id -i ~/.ssh/id_rsa.pub root@example.org
# sshpass -p RootPasswordExampleOrg ssh root@example.com "echo 'ssh-rsa ABCFG.........Z== otherkey@example.org' | tee -a ~/.ssh/authorized_keys"

### Server 3 ___________________________________________________________________
# ....
