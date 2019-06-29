# aguia-pescadora-ansible-playbooks

**[Trabalho em progresso] Infraestrutura como Código da
[Águia Pescadora](https://https://aguia-pescadora.etica.ai/) com Playbooks de Ansible. Veja também
[EticaAI/aguia-pescadora](https://github.com/EticaAI/aguia-pescadora)
e o projeto original, [fititnt/cplp-aiops](https://github.com/fititnt/cplp-aiops).**

O link para lista completa dos servidores da Etica.AI pode ser vista no painel da
organização em _[Etica.AI Infrastructure: Clusters & VPS](https://github.com/orgs/EticaAI/projects/2) <sup>inglês</sup>_.

[![Banner Águia Pescadora - © Andy Morffew www.andymorffew.com](img/aguia-pescadora-banner.jpg)](https://aguia-pescadora.etica.ai/)

----

<!-- TOC depthFrom:1 -->

- [aguia-pescadora-ansible-playbooks](#aguia-pescadora-ansible-playbooks)
    - [Como usar o aguia-pescadora-ansible-playbooks](#como-usar-o-aguia-pescadora-ansible-playbooks)
        - [Instalação do Ansible](#instalação-do-ansible)
    - [Executar o Playbook](#executar-o-playbook)
- [Veja também](#veja-também)
    - [Referências sobre a pilha de soluções da Águia Pescadora](#referências-sobre-a-pilha-de-soluções-da-águia-pescadora)
        - [Ansible](#ansible)
            - [Documentação Ansible-BR](#documentação-ansible-br)
            - [Documentação oficial do Ansible](#documentação-oficial-do-ansible)
        - [Kubernetes](#kubernetes)
            - [Documentação oficial do Kubernetes](#documentação-oficial-do-kubernetes)
    - [Referência de projetos semelhantes](#referência-de-projetos-semelhantes)
        - [Kubespray](#kubespray)
- [Licença](#licença)

<!-- /TOC -->

----

<!--
@TODO saber mais sobre o AWX Project https://github.com/ansible/awx (fititnt, 2019-06-29 04:15 BRT)
-->

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

## Executar o Playbook

```bash
ansible-playbook -i hosts aguia-pescadora.yml
```

_@TODO: documentar como executar o playbook (fititnt, 2019-06-28 09:34 BRT)_

# Veja também

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

[![Domínio Público](img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Emerson Rocha](https://github.com/fititnt)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
