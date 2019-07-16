# add-public-keys
- <https://github.com/EticaAI/aguia-pescadora-ansible-playbooks/tree/master/tarefa>

Script simples que permite adicionar chaves publicas e permitir autenticação sem
senha. Especialmente útil máquinas virtuais ou dedicadas em que o fornecedor
apenas fornece uma senha para fazer autenticação.

Esse script é provavelmente compatível com a maioria dos servidores linux. Sua
máquina local já deve possuir pelo menos `sshpass` e `ssh-copy-id`.

## Modo de usar

```bash
# Faça uma cópia do arquivo original
cp add-public-keys.dist.sh add-public-keys.sh

# Edite e troque as variaveis
vi add-public-keys.sh

# Execute o script
./add-public-keys.sh
```

# Licença
[![Domínio Público](../../img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Etica.AI](https://etica.ai)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
