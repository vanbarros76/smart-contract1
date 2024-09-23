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


