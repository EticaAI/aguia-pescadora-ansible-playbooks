# Testes da Águia Pescadora 2.0.x-alpha
### Referencia

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123
```
### Exemplos de testes em servidores reais

```bash
cd /alligo/code/eticaai/aguia-pescadora-ansible-playbooks
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-delta.etica.ai -e paas_ip=173.249.10.99
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-echo.etica.ai -e paas_ip=167.86.127.220
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-foxtrot.etica.ai -e paas_ip=167.86.127.225
```
