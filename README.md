# aguia-pescadora-ansible-playbooks

[![Banner Águia Pescadora - © Andy Morffew www.andymorffew.com](img/aguia-pescadora-banner.jpg)](https://aguia-pescadora.etica.ai/)

----

<!-- TOC depthFrom:1 -->

- [aguia-pescadora-ansible-playbooks](#aguia-pescadora-ansible-playbooks)
    - [Como usar o aguia-pescadora-ansible-playbooks](#como-usar-o-aguia-pescadora-ansible-playbooks)
        - [Instalação do Ansible](#instalação-do-ansible)
    - [Documentação adicional sobre a pilha de soluções da Águia Pescadora](#documentação-adicional-sobre-a-pilha-de-soluções-da-águia-pescadora)
        - [Ansible](#ansible)
            - [Documentação Ansible-BR](#documentação-ansible-br)
            - [Documentação oficial do Ansible](#documentação-oficial-do-ansible)
        - [Kubernetes](#kubernetes)
            - [Documentação oficial do Kubernetes](#documentação-oficial-do-kubernetes)
- [Licença](#licença)

<!-- /TOC -->

----

## Como usar o aguia-pescadora-ansible-playbooks

### Instalação do Ansible
Visite <https://docs.ansible.com/> e escolha uma forma de instalação mais
apropriada para seu sistema operacional e instale no seu computador local (ou
no computador que remoto que pretende usar). Note que Ansible não requer agente
nos computadores administrados por ele.

Por exemplo no meu caso, um Ubuntu 16.04 LTS Desktop, preferi usar o
[PPA oficial da Ansible](https://launchpad.net/~ansible/+archive/ubuntu/ansible)
em vez do padrão de sitema por estar mais atualizado.

```bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```


## Documentação adicional sobre a pilha de soluções da Águia Pescadora

### Ansible

#### Documentação Ansible-BR
- <http://ansible-br.org/>

#### Documentação oficial do Ansible
- <https://docs.ansible.com/> <sup>(Inglês)</sup>

### Kubernetes

#### Documentação oficial do Kubernetes

- <https://kubernetes.io/docs/> <sup>(Inglês)</sup>

# Licença

[![Domínio Público](img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Emerson Rocha](https://github.com/fititnt)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
