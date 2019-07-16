# Arquivos de configuração usados para inicializar clusters remotos
Esta pasta conterá uma cópia dos arquivos de configuração que são gerados
automaticamente para geração de um novo cluster caso você use o playbook
tldr.yml da versão 2.0-alpha.

Note que durante a etapa do tsuru-installer do tldr.yml o Ansible pode ficar
entre 10~50min sem exibir informações na tela, porém o resulado de
`tsuru install-create -c install-config.yml -e install-compose.yml` será salvo
em tsuru-install.log.

##### Acompanhar resultado to tsuru install-create

Não é trivial exibir na mesma tela de acompanhamento do Ansible o resultado de
um comando shell em tempo real, porém é salvo um arquivo de log na mesma pasta
em que os arquivos install-config.yml e install-compose.yml estão.

```bash
tail -f tsuru-initialization-configs/tsuru-install.log
```

Note que o arquivo acima inclusive a senha do administrador inicial.
