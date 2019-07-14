paas-host
=========

Um guia sem automação de ansible de como fazer algo parecido pode ser lido em
<https://github.com/EticaAI/aguia-pescadora/blob/master/diario-de-bordo/tsuru-inicializacao/seu-computador.sh>.

Veja também

- https://github.com/fititnt/cplp-aiops/issues/58
- https://github.com/fititnt/cplp-aiops/issues/59
- https://github.com/fititnt/cplp-aiops/tree/master/logbook/aguia-pescadora-charlie/__external-configs
- https://github.com/EticaAI/aguia-pescadora/issues/26
- https://github.com/EticaAI/aguia-pescadora/blob/master/diario-de-bordo/delta.sh


Arquivos 

- Erros do OpenResty (NGinx, AutoSSL, proxy de entrada...)
    - `/usr/local/openresty/nginx/logs/error.log`
- Acesso do OpenResty (NGinx, AutoSSL, proxy de entrada...)
    - `/usr/local/openresty/nginx/logs/access.log`

Requirements
------------

- Chave SSH sem senha (requerimento do Tsuru)
- Tsuru Client
- Docker
- Docker Machine

Em <https://github.com/EticaAI/aguia-pescadora/blob/master/diario-de-bordo/tsuru-inicializacao/seu-computador.sh>
explica como instalar tais requerimentos

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

Public Domain
