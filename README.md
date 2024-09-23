# Explicação detalhada para iniciantes:


## Aula 1:

Pragma solidity ^0.8.0; : define a versão do compilador Solidity que será usada.

Contract HelloWorld { }: defini o nome do contrato. Todo o código entre {} faz parte desse contrato.

String public message; : foi criada uma variável pública do tipo `string`. No Solidity, variáveis públicas tem um `getter` automático, o que significa que qualquer pessoa pode ler o valor de `message`.

UpdateCount: foi criada uma variável para contar quantas vezes a mensagem foi atualizada. 

Constructor( ) { }: o construtor é uma função especial que é chamada apenas 1 vez, quando o contrato é implantado na blockchain. Aqui, foi definida a mensagem inicial como "Hello, Blockchain!", bem como iniciado em "0" o contador da var updateCount.

Function updateMessage(string memory newMessage) public { }: esta função pública permite que qualqer pessoa atualize a mensagem armazenada no contrato. Foi usado o `memory` para indicar qua a nova mesagem é temporária e existe apenas enquanto a função é executada. Além disso, toda vez que updateMessage é chamada, o contador updateCount é incrementado em 1.


## Aula 2:

### Desafio: Crie um contrato que armazena um endereço de uma carteira Ethereum, e uma função que permite atualizar esse endereço.

`storageAddress`: armazena um endereço Ethereum.

`msg.sender`: recupera o endereço de quem está chamando a função.

`updateAddress`: permite atualizar o endereço armazenado com um novo.


## Aula 3:

### Desafio: Desenvolva um Smart Contract que seja capaz de armazenar o nome, idade e nacionalidade de uma pessoa brasileira em 3 variáveis distintas. O contrato deve dar a cada uma das variáveis, respectivamente, as visibilidades public, private e internal. Os dados da pessoa deverão ser "Isabella" para o nome, 10 para a idade e true para a nacionalidade brasileira, através do construtor. Desenvolva funções set e get necessárias, bem como funções para incrementar a idade da pessoa.


**Declaração de Variáveis**

`name`: Uma variável pública que armazena o nome da pessoa. Como é pública, qualquer pessoa pode ver seu valor diretamente, sem necessidade de uma função getter.

`age`: Uma variável privada que armazena a idade da pessoa. Variáveis privadas só podem ser acessadas dentro do contrato.

`brazilian`: Uma variável interna que armazena um valor booleano (`true` ou `false`) indicando se a pessoa é brasileira. Variáveis internas são acessíveis apenas dentro do contrato e em contratos que herdam dele.

**Construtor**

O construtor inicializa o contrato com os valores padrão: nome "Isabella", idade 10, e a pessoa como brasileira. O construtor é executado uma única vez, quando o contrato é implantado na blockchain.

**Funções de Setters e Getters**

As funções `setName` e `getName`permitem que qualquer pessoa altere o nome e a idade armazenados no contrato. A função `setName` recebe um valor string e a `setAge` recebe um valor uint (inteiro sem sinal).

Como a variável `age` é declarada como privada (lá no início do contrato), ela não pode ser acessada diretamente fora do contrato. Assim, a função `view` permite que qualquer pessoa apenas consulte a idade atual.

As funções `setNationalityBR` e `getNationalityBR` permitem definir e obter o valor booleano que indica se a pessoa é brasileira ou não. `setNationalityBR` recebe um parâmetro _braz (booleano) e `getNationalityBR` retorna o valor atual da variável `brazilian`.

**Função Interna para Adição**

A função `addValues` é uma função interna que adiciona dois valores inteiros. Como é `internal`, ela só pode ser chamada dentro deste contrato ou de contratos que herdem dele.

O modificador `pure` significa que esta função não lê nem escreve em variáveis de estado, apenas opera sobre os parâmetros fornecidos.

**Função para Incrementar a Idade**

A função `incrementAge` usa a função `addValues` para incrementar a idade em 1. Ela é marcada como `external`, o que significa que só pode ser chamada de fora do contrato (não de dentro).


