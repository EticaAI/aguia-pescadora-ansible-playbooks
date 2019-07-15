# Ansible Playbooks da Águia Pescadora

**![Situação: Trabalho em Progresso](img/badges/status-work-in-progress.svg) Infraestrutura como Código da
[Águia Pescadora](https://https://aguia-pescadora.etica.ai/) com Playbooks de Ansible. Veja também
[EticaAI/aguia-pescadora](https://github.com/EticaAI/aguia-pescadora)
e o projeto original, [fititnt/cplp-aiops](https://github.com/fititnt/cplp-aiops).**

O link para lista completa dos servidores da Etica.AI pode ser vista no painel da
organização em _[Etica.AI Infrastructure: Clusters & VPS](https://github.com/orgs/EticaAI/projects/2) <sup>inglês</sup>_.

Acompanhe as versões lançadas usando Ansible em <https://github.com/EticaAI/aguia-pescadora-ansible-playbooks/releases>.

<!-- https://aguia-pescadora.etica.ai/evolucao -->

[![Banner Águia Pescadora - © Andy Morffew www.andymorffew.com](img/aguia-pescadora-banner.jpg)](https://aguia-pescadora.etica.ai/)

[![Website: aguia-pescadora.etica.ai](img/badges/website.svg)](https://aguia-pescadora.etica.ai) [![GitHub: EticaAI/aguia-pescadora-ansible-playbooks](img/badges/github.svg)](https://github.com/EticaAI/aguia-pescadora-ansible-playbooks)

---

### TL;DR

[![Versão: 2.0-alpha](img/badges/version-2.0-alpha.svg)](https://aguia-pescadora.etica.ai/evolucao/) Ubuntu Server 18.04, 1vCPU, 512MB RAM, 10GB disco

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123

# Senha do Admin do tsuru: tsuru-initialization-configs/tsuru-install.log
# Senha do Minio: example.com:/usr/local/share/minio/.minio.sys/config/config.json
```
Exemplo de execução do início ao fim dos passos acima:

[![asciicast](https://asciinema.org/a/18k4z7mCYgBgSQbI3eiZ6RrdB.svg)](https://asciinema.org/a/18k4z7mCYgBgSQbI3eiZ6RrdB)

Sem configurações extras, uma implementação baseada na versão acima teria uma
estrutura de URLs semelhante a esta:

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

#### Limitações da 2.0-alpha

Pontos de melhoria (i.e. o que poderia, mas não tem, automaticamente configurado):

- Não usa Kubernetes ou K3S (o que não necessariamente é ponto negativo)
- Tsuru Gandalf (isto é, permitir por em produção usando `git push` em vez de `tsuru app-deploy --app meuapp .` )
- Tsuru MySQL As A Service (alternativa: usar MySQL via app com Docker)
- Tsuru PostgreSQL As A Service (alternativa: usar PostgreSQL via app com docker)
- Tsuru volumes

<!--
> Aviso: a versão da 2.0 provavelmente nunca sair nem mesmo de versão alpha é
que o foco tenderá a ser uma implementação do Águia Pescadora otimizada com
Kubernetes em vez de Docker; esté é o motivo de existir referências a uma versão
3.0 ou 2.5.
-->

<!--
Comentários adicionais pertinentes:

- Como foco é preparar a 3.0 (com Kubernetes) e otimizar gerenciamento do dia a
  dia em produção versão 2.0 (que permanecerá usando apenas docker)
  provavelmente não sairá de versões alpha.
- Talvez algumas funcionalidades da 2.5 ou 3.0 sejam adicionadas na 2.x em
  especial se os requisitos de hardware for maior; não obstante as versões 2.x,
  não vão ser otimizadas para clusters maiores do que 1 e modo de
  'alta disponibilidade';

-->

---

<!-- TOC depthFrom:1 -->

- [Ansible Playbooks da Águia Pescadora](#ansible-playbooks-da-águia-pescadora)
        - [TL;DR](#tldr)
            - [Limitações da 2.0-alpha](#limitações-da-20-alpha)
    - [Como usar o aguia-pescadora-ansible-playbooks](#como-usar-o-aguia-pescadora-ansible-playbooks)
        - [2.0.x alpha](#20x-alpha)
            - [Roles](#roles)
                - [paas-host](#paas-host)
                - [tsuru-installer](#tsuru-installer)
            - [Requisitos](#requisitos)
                - [Seu computador local](#seu-computador-local)
                    - [Instalação do Ansible](#instalação-do-ansible)
                - [Servidores remotos](#servidores-remotos)
                - [Acompanhar resultado to tsuru install-create](#acompanhar-resultado-to-tsuru-install-create)
- [Licença](#licença)
    - [Licença de aguia-pescadora-ansible-playbooks](#licença-de-aguia-pescadora-ansible-playbooks)

<!-- /TOC -->

----

<!--
@TODO saber mais sobre o AWX Project https://github.com/ansible/awx (fititnt, 2019-06-29 04:15 BRT)
-->

## Como usar o aguia-pescadora-ansible-playbooks

### 2.0.x alpha

Neste momento apenas a versão 2.0.x-alpha (que tem seu passo a passo muito
resumidamente) explicada no início deste documento em "TL;DR" está documentada.

Note que a 2.0.x **não** usa Kubernetes ou K3S e é uma versão de apenas 1 nó,
porém automatizada do que antes era documentado em [EticaAI/aguia-pescadora/diario-de-bordo](https://github.com/EticaAI/aguia-pescadora/tree/master/diario-de-bordo).

#### Roles

##### paas-host

- [paas-host](roles/paas-host/README.md)

`paas-host` é a função responsável por preparar a(s) VPSs para fazer
terminação TLS (isto é, servir o primeiro acesso HTTPS) que chegam no servidor.
Usa o [OpenResty](https://github.com/openresty/openresty) +
[GUI/lua-resty-auto-ssl](https://github.com/GUI/lua-resty-auto-ssl).

##### tsuru-installer

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

#### Requisitos

##### Seu computador local

###### Instalação do Ansible
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

##### Servidores remotos

Note que o nível de automação que aguia-pescadora-ansible-playbooks fornece
pode ser suficiente para ter uma versão de Águia Pescadora aceitavelmente ok
e economizar pelo menos 80% de trabalho. **Isto é, ao usar estas rotinas o(s)
servidores remotos estarão com pacotes instalados e prontos para uso inicial**.

- **Ubuntu Server 18.04 LTS**
    - Versão mais testada. Você pode tentar em outras com alterações nestes
      playbooks.
- **Autenticação por chave privada**
    - Caso opte por instalar com o tldr.yml o `tsuru-client` requer que a
      chave privada usada no momento da instalação seja sem senha.

##### Acompanhar resultado to tsuru install-create

Não é trivial exibir na mesma tela de acompanhamento do Ansible o resultado de
um comando shell em tempo real, porém é salvo um arquivo de log na mesma pasta
em que os arquivos install-config.yml e install-compose.yml estão.

```bash
tail -f tsuru-initialization-configs/tsuru-install.log
```

Note que o arquivo acima inclusive a senha do administrador inicial.

# Licença

<!--

_@TODO: explicar sobre licenças extras (fititnt, 2019-06-30 05:53 BRT)_

-->

## Licença de aguia-pescadora-ansible-playbooks

[![Domínio Público](img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Emerson Rocha](https://github.com/fititnt)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
