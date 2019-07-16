# Testes do Águia Pescadora

## Informações de debug

```bash
# Imprime informação completa do ansible_facts para cada host
ansible aguia-pescadora-delta.etica.ai -m setup
ansible aguia-pescadora-echo.etica.ai -m setup
ansible aguia-pescadora-foxtrot.etica.ai -m setup

# Pacotes instalados
ansible aguia-pescadora-delta.etica.ai -m package_facts
ansible aguia-pescadora-echo.etica.ai -m package_facts
ansible aguia-pescadora-foxtrot.etica.ai -m package_facts
```

> package_facts esta dando erro _"[WARNING]: Requested package manager apt was not usable by this module: 'APT' object has no attribute '_cache'"_
> 
> - https://github.com/ansible/ansible/pull/56008
> - https://github.com/bcoca/ansible/blob/1b7e421cf22612160dbdaac6627bcd19cf0448f8/lib/ansible/modules/packaging/os/package_facts.py
> 
> Hotfix:
> trocar `/home/fititnt/anaconda3/lib/python3.7/site-packages/ansible/modules/packaging/os/package_facts.py`
>
> por `https://github.com/bcoca/ansible/blob/1b7e421cf22612160dbdaac6627bcd19cf0448f8/lib/ansible/modules/packaging/os/package_facts.py`

## Exemplos de instalação

### 2.0.x-alpha tldr.yml
#### Referencia

```bash
git clone -b v2.0-alpha --single-branch https://github.com/EticaAI/aguia-pescadora-ansible-playbooks.git .
ansible-playbook tldr.yml -e paas_host=example.com -e paas_ip=123.123.123.123

# Senha do Admin do tsuru: tsuru-initialization-configs/tsuru-install.log
# Senha do Minio: example.com:/usr/local/share/minio/.minio.sys/config/config.json
```
#### Exemplos de testes em servidores reais

```bash
cd /alligo/code/eticaai/aguia-pescadora-ansible-playbooks
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-delta.etica.ai -e paas_ip=173.249.10.99
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-echo.etica.ai -e paas_ip=167.86.127.220
ansible-playbook tldr.yml -e paas_host=aguia-pescadora-foxtrot.etica.ai -e paas_ip=167.86.127.225
```
