# Explicação detalhada para iniciantes:

Pragma solidity ^0.8.0; : define a versão do compilador Solidity que será usada.

Contract HelloWorld { }: defini o nome do contrato. Todo o código entre {} faz parte desse contrato.

String public message; : criei uma variável pública do tipo ´string´. No Solidity, variáveis públicas tem um ´getter´ automático, o que significa que qualquer pessoa pode ler o valor de ´message´.

UpdateCount: criei uma variável para contar quantas vezes a mensagem foi atualizada. 

Constructor( ) { }: o construtor é uma função especial que é chamada apenas 1 vez, quando o contrato é implantado na blockchain. Aqui, defini a mensagem inicial como "Hello, Blockchain!", bem como iniciei em "0" o contador da var updateCount.

Function updateMessage(string memory newMessage) public { }: esta função pública permite que qualqer pessoa atualize a mensagem armazenada no contrato. Usei o ´memory´ para indicar qua a nova mesagem é temporária e existe apenas enquanto a função é executada. Além disso, toda vez que updateMessage é chamada, o contador updateCount é incrementado em 1.
