# add-public-keys
Script simples que permite adicionar chaves publicas e permitir autenticação sem
senha. Especialmente útil máquinas virtuais ou dedicadas em que o fornecedor
apenas fornece uma senha para fazer autenticação.

Esse script é provavelmente compatível com a maioria dos servidores linux. Sua
máquina local já deve possuir pelo menos `sshpass` e `ssh-copy-id`.

## Modo de usar
Executar duas vezes o script (por exemplo, acidentalmente) não gera tem efeito
negativo ao usar `ssh-copy-id` ele próprio evita adicionar uma chave pública
duplicada.

**Atenção: caso você queira usar APENAS uma vez é melhor apenas ler o conteúdo
de [add-public-keys.sh](add-public-keys.sh) copiar manualmente os comandos,
sem precisar salvar em seu computador. O único comando importante é
`ssh-copy-id`, todos os demais são voltados para uso automatizado, sem interação
de um humano**.

### Simples

```bash
# Faça uma cópia do arquivo original
cp add-public-keys.dist.sh add-public-keys.sh

# Edite e troque as variaveis
vi add-public-keys.sh

# Execute o script
./add-public-keys.sh
```

### Multiplos

Caso queira fazer isso para grupos de servidores diferentes, pode copiar para arquivos diferentes em vez de colocar TODOS em um grande arquivo.


```bash
cp add-public-keys.dist.sh add-public-keys-cluster1.sh
vi add-public-keys-cluster1.sh
cp add-public-keys.dist.sh add-public-keys-cluster2.sh
vi add-public-keys-cluster2.sh
cp add-public-keys.dist.sh add-public-keys-cluster3.sh
vi add-public-keys-cluster3.sh

./add-public-keys-cluster1.sh
./add-public-keys-cluster2.sh
./add-public-keys-cluster3.sh
```
### Avisos de segurança

#### Evite salvar senhas em repositórios git
**É recomendado não salvar senhas planas sem criptografia em repositórios git,
mesmo que sejam privados**, porém casos muito especiais (como certas automações
e testes rápidos com servidores que mesmo se senhas forem vazadas uma pessoa
externa não teriam acesso) seria tolerável.

Uma dica rápida é tratar o arquivo inteiro como uma senha, onde é melhor perder
o arquivo e ter que recriar do que salvar ele fora de um computador local.

#### sshpass
Este script faz uso do `sshpass` e, como tal, idealmente só deveria ser
executado em máquinas locais que você confia, pois ao passar a senha de outro
servidor por parametro em vez de usar o `ssh-copy-id` se seu sistema tiver
monitoramento de comandos (e até mesmo histórico do seu terminal) as senhas
poderiam ficar em logs.

# Licença
[![Domínio Público](../../img/public-domain.png)](UNLICENSE)

Na medida do possível segundo a lei, [Etica.AI](https://etica.ai)
renunciou a todos os direitos autorais e direitos conexos ou vizinhos a este
trabalho para o [Domínio Público](UNLICENSE).
