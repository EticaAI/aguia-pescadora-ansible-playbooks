# Ansible Playbooks da Águia Pescadora

**![Situação: Trabalho em Progresso](img/badges/status-work-in-progress.svg) Infraestrutura como Código da
[Águia Pescadora](https://https://aguia-pescadora.etica.ai/) com Playbooks de Ansible. Veja também
[EticaAI/aguia-pescadora](https://github.com/EticaAI/aguia-pescadora)
e o projeto original, [fititnt/cplp-aiops](https://github.com/fititnt/cplp-aiops).**

O link para lista completa dos servidores da Etica.AI pode ser vista no painel da
organização em _[Etica.AI Infrastructure: Clusters & VPS](https://github.com/orgs/EticaAI/projects/2) <sup>inglês</sup>_.

[![Banner Águia Pescadora - © Andy Morffew www.andymorffew.com](img/aguia-pescadora-banner.jpg)](https://aguia-pescadora.etica.ai/)

[![Website: aguia-pescadora.etica.ai](img/badges/website.svg)](https://aguia-pescadora.etica.ai) [![GitHub: EticaAI/aguia-pescadora-ansible-playbooks](img/badges/github.svg)](https://github.com/EticaAI/aguia-pescadora-ansible-playbooks) ![Versão: 2.0-alpha](img/badges/version-2.0-alpha.svg)

---

**TL;DR:**

Ubuntu Server 18.04, 1vCPU, 512MB RAM, 10GB disco

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123
```

<!--
```bash
# TODO: escrever um tldr.yml (fititnt, 2019-07-01 30:57 BRT)
# @see https://github.com/EticaAI/aguia-pescadora/issues/27
git clone https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook 1-node-tsuru-autossl.yml -e paas_host=example.com
```

-->

<!--
Exemplo com 3 nós:
ansible-playbook 1-node-tsuru-autossl.yml -e paas_host=example.com

Exemplo que estou testando:
ansible-playbook -i inventory/1-node-exemplo/inventory.ini  1-node-tsuru-autossl.yml

-->

> - Tsuru URLs:
>   - https://tsuru.example.com
>   - https://tsuru-dashboard.example.com
> - Minio:
>   - https://minio.example.com
> - Apps URLs (_app.**{paas_host}**_):
>   - https://meu-app-1.app.example.com
>   - https://my-app2.app.example.com
>   - https://mi-aplicación-tre.app.example.com
>   - ...

---

<!-- TOC depthFrom:1 -->

- [Ansible Playbooks da Águia Pescadora](#ansible-playbooks-da-águia-pescadora)
    - [Como usar o aguia-pescadora-ansible-playbooks](#como-usar-o-aguia-pescadora-ansible-playbooks)
        - [Executar os Playbooks](#executar-os-playbooks)
            - [1-node](#1-node)
            - [1-node-tsuru-autossl](#1-node-tsuru-autossl)
        - [Requisitos](#requisitos)
            - [Seu computador local](#seu-computador-local)
                - [Instalação do Ansible](#instalação-do-ansible)
            - [Servidores remotos](#servidores-remotos)
    - [Sobre este Ansible Playbook](#sobre-este-ansible-playbook)
        - [Roles](#roles)
            - [paas-host](#paas-host)
            - [tsuru-installer](#tsuru-installer)
                - [Acompanhar resultado to tsuru install-create](#acompanhar-resultado-to-tsuru-install-create)
    - [Referências sobre a pilha de soluções da Águia Pescadora](#referências-sobre-a-pilha-de-soluções-da-águia-pescadora)
        - [Ansible](#ansible)
            - [Documentação Ansible-BR](#documentação-ansible-br)
            - [Documentação oficial do Ansible](#documentação-oficial-do-ansible)
        - [Kubernetes](#kubernetes)
            - [Documentação oficial do Kubernetes](#documentação-oficial-do-kubernetes)
    - [Referência de projetos semelhantes](#referência-de-projetos-semelhantes)
        - [Kubespray](#kubespray)
- [Licença](#licença)
    - [Licença de aguia-pescadora-ansible-playbooks](#licença-de-aguia-pescadora-ansible-playbooks)

<!-- /TOC -->

----

<!--
@TODO saber mais sobre o AWX Project https://github.com/ansible/awx (fititnt, 2019-06-29 04:15 BRT)
-->

## Como usar o aguia-pescadora-ansible-playbooks

Documentação mais específica em [aguia-pescadora.md](aguia-pescadora.md)

### Executar os Playbooks
A pessoa mantenedora, Emerson Rocha, recentemente começou a usar Ansible e ainda
está convertendo scripts e estratégias para o novo padrão. Pode levar um tempo
até implementação desse nível de automação, porém pode ajudar em especial
reuso por colegas. Grato pela compreensão :).

#### 1-node
![Situação: Trabalho em Progresso](img/badges/status-work-in-progress.svg)
Águia Pescadora PaaS Tudo-Em-Um-Nó.

```bash
ansible-playbook -i inventory/1-node-exemplo/inventory.ini  1-node.yml
```

#### 1-node-tsuru-autossl
![Situação: Trabalho em Progresso](img/badges/status-work-in-progress.svg)
Águia Pescadora PaaS Tudo-Em-Um-Nó (Tsuru PaaS, Minio, AutoSSL via OpenResty).
Esta opção não usa Kubernetes ou k3s.

```bash
ansible-playbook -i inventory/1-node-exemplo/inventory.ini  1-node-tsuru-autossl.yml
```

### Requisitos

#### Seu computador local

##### Instalação do Ansible
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

#### Servidores remotos

Note que o nível de automação que aguia-pescadora-ansible-playbooks fornece
pode ser suficiente para ter uma versão de Águia Pescadora aceitavelmente ok
e economizar pelo menos 80% de trabalho. **Isto é, ao usar estas rotinas o(s)
servidores remotos estarão com pacotes instalados e prontos para uso inicial**.

- **Ubuntu Server 18.04 LTS**
    - Versão mais testada. Você pode tentar em outras com alterações nestes
      playbooks.
- **Autenticação por chave privada**
    - Caso opte por instalar com o 1-node.yml o `tsuru-client` requer que a
      chave privada usada no momento da instalação seja sem senha.

## Sobre este Ansible Playbook

### Roles

<!--
 #### common

- [common](roles/common/README.md)
-->

#### paas-host

- [paas-host](roles/paas-host/README.md)

`paas-host` é a função responsável por preparar a(s) VPSs para fazer
terminação TLS (isto é, servir o primeiro acesso HTTPS) que chegam no servidor.
Usa o [OpenResty](https://github.com/openresty/openresty) +
[GUI/lua-resty-auto-ssl](https://github.com/GUI/lua-resty-auto-ssl).

#### tsuru-installer

- [tsuru-installer](roles/tsuru-installer/README.md)

Oferece uma versão mais limitada do que o fantástico
[Tsuru Installer](https://docs.tsuru.io/stable/installing/using-tsuru-installer.html)
automatizaria por você.

A função dele é criar na pasta [tsuru-initialization-configs](tsuru-initialization-configs/)
os arquivos de configuração que são parâmetros usados na chamada
`tsuru install-create -c install-config.yml -e install-compose.yml`. Caso você
não tenha o [Docker](https://docs.docker.com/install/),
[Docker Machine](https://docs.docker.com/machine/install-machine/) e o
[Tsuru Client](https://tsuru-client.readthedocs.io/en/latest/installing.html)
irá alertar.

<!--
As principais diferenças entre a documentação padrão do Tsuru são:
1. Gera arquivos de configuração

-->

##### Acompanhar resultado to tsuru install-create

Não é trivial exibir na mesma tela de acompanhamento do Ansible o resultado de
um comando shell em tempo real, porém é salvo um arquivo de log na mesma pasta
em que os arquivos install-config.yml e install-compose.yml estão.

```bash
tail -f tsuru-initialization-configs/tsuru-install.log
```

Note que o arquivo acima inclusive a senha do administrador inicial.
Mais informações em breve.

## Referências sobre a pilha de soluções da Águia Pescadora

### Ansible

#### Documentação Ansible-BR
- <http://ansible-br.org/>

#### Documentação oficial do Ansible
- <https://docs.ansible.com/> <sup>(Inglês)</sup>

### Kubernetes

#### Documentação oficial do Kubernetes

- <https://kubernetes.io/docs/> <sup>(Inglês)</sup>

<!--
@TODO ver projetos extras de interesse potencial do usuário (fititnt, 2019-06-28 09:31 BRT)
-->

## Referência de projetos semelhantes

### Kubespray

Kubespray é mantido pelos grupos de interesse especial do Kubernetes e documenta
como por um cluster de Kubernentes pronto para uso em produção

- Ansible Playbook: <https://github.com/kubernetes-sigs/kubespray> <sup>(Inglês)</sup>
- Documentação: <https://kubespray.io> <sup>(Inglês)</sup>

# Licença

_@TODO: explicar sobre licenças extras (fititnt, 2019-06-30 05:53 BRT)_

## Licença de aguia-pescadora-ansible-playbooks

[![Domínio Público](img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Emerson Rocha](https://github.com/fititnt)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
