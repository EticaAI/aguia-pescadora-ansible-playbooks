# aguia-pescadora-info

**NOTA: a tarefa `aguia-pescadora-info` tem o especial cuidado de apenas
executar comandos que não fazem alterações. Útil para saber estado de hosts,
mesmo os não configurados em Ansible.**

Esta tarefa irá acessar todas as máquinas do seu inventório (exceto sí mesma),
obter e informar o máximo de informações pertinentes sobre hosts que
potencialmente foram configurados usando instruções do Águia Pescadora.

```bash
# Caso esteja no diretório tarefa/aguia-pescadora-info/, use:
ansible-playbook aguia-pescadora-info.yml

# Do contrário, use o caminho completo
ansible-playbook tarefa/aguia-pescadora-info/aguia-pescadora-info.yml
```
