# Ansible Playbooks da Águia Pescadora

**![Situação: Trabalho em Progresso](img/badges/status-work-in-progress.svg)
Infraestrutura como Código da [Águia Pescadora](https://aguia-pescadora.etica.ai/)
(_a evolução do [cplp-aiops](https://github.com/fititnt/cplp-aiops)_)
com playbooks de Ansible especialmente preparado para pessoas com menor
experiência em infraestrutura ou acesso a recursos financeiros possam replicar.
Trabalho (tanto códigos como documentação) dedicados ao domínio público.**

O link para lista completa dos servidores da Etica.AI pode ser vista no painel da
organização em _[Etica.AI Infrastructure: Clusters & VPS](https://github.com/orgs/EticaAI/projects/2) <sup>inglês</sup>_.

<!--
Acompanhe as versões lançadas usando Ansible em <https://github.com/EticaAI/aguia-pescadora-ansible-playbooks/releases>.
-->

<!-- https://aguia-pescadora.etica.ai/evolucao -->

[![Banner Águia Pescadora - © Andy Morffew www.andymorffew.com](img/aguia-pescadora-banner.jpg)](https://aguia-pescadora.etica.ai/)

[![Website: aguia-pescadora.etica.ai](img/badges/website.svg)](https://aguia-pescadora.etica.ai) [![GitHub: EticaAI/aguia-pescadora-ansible-playbooks](img/badges/github.svg)](https://github.com/EticaAI/aguia-pescadora-ansible-playbooks)

---

### TL;DR do 2.0-alpha

[![Versão: 2.0-alpha](img/badges/version-2.0-alpha.svg)](https://aguia-pescadora.etica.ai/evolucao/) Ubuntu Server 18.04, 1vCPU, 512MB RAM, 10GB disco

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123

# Senha do Admin do tsuru: tsuru-initialization-configs/tsuru-install.log
# Senha do Minio: example.com:/usr/local/share/minio/.minio.sys/config/config.json
```
Exemplo de execução do início ao fim dos passos acima:

[![asciicast](https://asciinema.org/a/XVvYrlSyQPeipOX1GHwYdy5bR.svg)](https://asciinema.org/a/XVvYrlSyQPeipOX1GHwYdy5bR)

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

---

<!-- TOC depthFrom:1 -->

- [Ansible Playbooks da Águia Pescadora](#ansible-playbooks-da-águia-pescadora)
        - [TL;DR do 2.0-alpha](#tldr-do-20-alpha)
    - [Como usar o aguia-pescadora-ansible-playbooks](#como-usar-o-aguia-pescadora-ansible-playbooks)
        - [2.0.x alpha](#20x-alpha)
            - [Instalação da 2.0.x alpha](#instalação-da-20x-alpha)
            - [O que a versão 2.0.x alpha automatiza por você](#o-que-a-versão-20x-alpha-automatiza-por-você)
            - [Limitações da versão 2.0.x alpha](#limitações-da-versão-20x-alpha)
            - [Ansible Roles da versão 2.0.x alpha](#ansible-roles-da-versão-20x-alpha)
                - [paas-host](#paas-host)
                - [tsuru-installer](#tsuru-installer)
            - [Requisitos](#requisitos)
                - [No seu nó de controle](#no-seu-nó-de-controle)
                    - [Instalação do Ansible](#instalação-do-ansible)
                - [Servidores remotos](#servidores-remotos)
- [Avançado](#avançado)
    - [Tarefas de auxílio](#tarefas-de-auxílio)
    - [Testes](#testes)
- [Licença](#licença)
    - [Licença de aguia-pescadora-ansible-playbooks](#licença-de-aguia-pescadora-ansible-playbooks)

<!-- /TOC -->

----

<!--
@TODO saber mais sobre o AWX Project https://github.com/ansible/awx (fititnt, 2019-06-29 04:15 BRT)
-->

## Como usar o aguia-pescadora-ansible-playbooks

Note que a 2.0.x alpha **não** usa Kubernetes ou K3S e é uma versão de apenas 1 nó,
porém automatizada do que antes era documentado em [EticaAI/aguia-pescadora/diario-de-bordo](https://github.com/EticaAI/aguia-pescadora/tree/master/diario-de-bordo) e que é mais flexível (porém exige conhecimento mais avançado
pra testes rapidos e ler o passo a passo).

### 2.0.x alpha

#### Instalação da 2.0.x alpha
Uma das formas de instalar a versão 2.0.x alpha é a seguinte:

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123

# Senha do Admin do tsuru: tsuru-initialization-configs/tsuru-install.log
# Senha do Minio: example.com:/usr/local/share/minio/.minio.sys/config/config.json
```

#### O que a versão 2.0.x alpha automatiza por você

- PaaS 1 nó (master e workers na mesma VPS)
  - Recomendamos Ubuntu 18.04
  - Hardware mínimo: 1vCPU, 512MB RAM, 10GB disco
- [OpenResty (fork do NGinx)](https://openresty.org) com [GUI/lua-resty-auto-ssl](https://github.com/GUI/lua-resty-auto-ssl)
  - Função:
    - faz terminação TLS (isto é, servir o primeiro acesso HTTPS) que chegam no servidor.
    - Note: ele obtem SSL para _qualquer_ domínio que aponte para seu servidor
      sem invervenção manual de administrador o que pode ser extremamente
      interessante e prático para quem está vindo de outros ambinetes que
      oferecem let's encript de graça; porém pode exigir ajustes extras para
      quem não precisa disto
- [Minio](https://min.io/)
- Tsuru Server com core components (via [tsuru Installer](https://docs.tsuru.io/stable/installing/using-tsuru-installer.html)), em especial:
  - Tsuru Dashboard / Tsuru API
  - Database para o Tsuru (MongoDB, é usado apenas pelo próprio Tsuru)
  - Queue/Cache para o Tsuru (Redis, é usado apenas pelo próprio Tsuru)
  - Docker Registry
  - PlanB (Usado apelas pelo Tsuru, não serve HTTP ou HTTPS para fora do cluster)
  - Docker

A versão 2.0.x alpha é uma implementação mais reduzida (porém automatizada) do
[EticaAI/aguia-pescadora/diario-de-bordo](https://github.com/EticaAI/aguia-pescadora/tree/master/diario-de-bordo)
documenta ser possível. Em vez de dar "todas as opções" e exigir que o usuário
tenha que ler outras dezenas de referências extenas ela procura ser primeira
versão pública da Etica.AI de um PaaS "Faça-você-mesmo" que consiga ser
compatível caso você queira aproveitar apenas a documentação e experiência com
pilha de soluções da Águia Pescadora sem usar a hospedagem gratuita.

Para quem tem conhecimento técnico prévio mais avançado você talvez pode usar o
[EticaAI/aguia-pescadora/diario-de-bordo](https://github.com/EticaAI/aguia-pescadora/tree/master/diario-de-bordo)
ou tomar como ponto de partida a instalação do Tsuru em
<https://docs.tsuru.io/stable/installing/index.html>. Como o número de pessoas
desenvolvedores realmente criando uma PaaS é reduzida ainda assim você pode se
beneficiar de partes do que é testamos e como documentação/código são liberados
não apenas como código aberto, mas como dedicados ao domínio publico você pode
reaproveitar em outros projetos. Porém note que não temos como dar suporte nem
fazer garantias além da que nosso trabalho é feito em boa fé e que de fazemos
isso como estratégias para projetos como o <https://cplp.etica.ai/>.

#### Limitações da versão 2.0.x alpha

Pontos de melhoria (isto é, o que NÃO é configurado automaticamente):

- Não expõe como configurar mais de um nó (porém isso pode simplificar não apenas custos, mas trabalho do administrador que não requer alta disponibilidade)
- Não usa Kubernetes ou K3S (o que não necessariamente é ponto negativo)
- Tsuru Gandalf (isto é, permitir por em produção usando `git push` em vez de `tsuru app-deploy --app meuapp .` )
- Tsuru MySQL As A Service (alternativa: usar MySQL via app com Docker)
- Tsuru PostgreSQL As A Service (alternativa: usar PostgreSQL via app com docker)
- Tsuru volumes

A versão do 2.0.x alpha lançaca mesmo apelidada de `tldr.yml` ainda requer que
a pessoa tenha que resolver alguns [Requisitos](#Requisitos). Porém tenha em
mente que ao menos ela não tem aprisionamento tecnológico de forçar que use
um provedor específico de infraestrutura (que geralmente são mais caros). E
nosso público alvo não teria tais recursos financeiros. Porém no futuro talvez
consigamos simplificar ainda mais.

<!--

#### Ansible Roles da versão 2.0.x alpha

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

-->

#### Requisitos

##### No seu nó de controle

###### Instalação do Ansible
Veja [tarefa/ansible-install](tarefa/ansible-install).

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

# Avançado

## Tarefas de auxílio
Veja pasta [tarefa](tarefa/)

## Testes
> **:warning: Muito cuidado ao executar automações da `teste/` :warning:**

Veja pasta [teste](teste/).

# Licença

<!--

_@TODO: explicar sobre licenças extras (fititnt, 2019-06-30 05:53 BRT)_

-->

## Licença de aguia-pescadora-ansible-playbooks

[![Domínio Público](img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Etica.AI](https://etica.ai)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
