# Arquivos de configuração usados para inicializar clusters remotos
Esta pasta conterá uma cópia dos arquivos de configuração que são gerados
automaticamente para geração de um novo cluster caso você use o playbook
tldr.yml da versão 2.0-alpha.

Note que durante a etapa do tsuru-installer do tldr.yml o Ansible pode ficar
entre 10~50min sem exibir informações na tela, porém o resulado de
`tsuru install-create -c install-config.yml -e install-compose.yml` será salvo
em tsuru-install.log.
