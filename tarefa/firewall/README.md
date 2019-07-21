# firewall

> **:warning: Use `--check` (modo do Ansible testar sem executar) mesmo que você
saiba o que está fazendo**

> :green_heart: `firewall.yml`, para proteger usuários, não irá bloquear acesso
a porta 22 SSH por padrão (porém irá limitar brute forces). Então _na pior das
hipóteses_ poderá abrir porta 22 que não estava bloqueada antes e/ou bloquear
outras portas mas não vai trancar um usuário de acessar o próprio servidor.

## Uso para 1 Host

```bash
# Caso esteja no diretório tarefa/firewall/, use:
ansible-playbook -i hosts firewall.yml --check
ansible-playbook -i hosts firewall.yml

# Do contrário, use o caminho completo
ansible-playbook -i inventory/1-node-example/inventory.ini tarefa/firewall/firewall.yml --check
ansible-playbook -i inventory/1-node-example/inventory.ini tarefa/firewall/firewall.yml
```

## Uso para um grupo de hosts

```bash
# Caso esteja no diretório tarefa/firewall/, use:
ansible-playbook -i hosts-cluster firewall.yml --check
ansible-playbook -i hosts-cluster firewall.yml
```
A seguir um asciinema com exemplo de uso

[![asciicast](https://asciinema.org/a/258426.svg)](https://asciinema.org/a/258426)

<!--
ansible-playbook -i hosts-cluster firewall.yml
-->
<!--
Para gravar asciinema

asciinema rec aguia-pescadora-tarefa-firewall--cluster-2019-07-21-09-21 --title="Águia Pescadora/Tarefa/Firewall, 'hosts-cluster' v2019-07-21-09-21" --idle-time-limit=10

-->

## Debug

### Acessando maquina remota

```bash
ssh user@example.com
sudo ufw status verbose
```

### Escanear portas com NMAP

```bash
# Escaneia hosts remotos com programa NMAP instalado localmente (scan rápido)
ansible-playbook -i hosts firewall-debug.yml
```

### Escanear usando serviços gratúitos externos

Alguns sites podem permitir que você escaneie de um IP que não deveria acessar
portas de seu servidor. Note que maioria dos hosts gratuitos não permite
escaneamento completo.

- <http://www.t1shopper.com/tools/port-scan/>
- <https://pentest-tools.com/network-vulnerability-scanning/tcp-port-scanner-online-nmap>
- <http://www.ipv6scanner.com/cgi-bin/main.py>
- <https://hackertarget.com/nmap-online-port-scanner/>

# Licença
[![Domínio Público](../../img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Etica.AI](https://etica.ai)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](../../UNLICENSE).
