# Explicação detalhada para iniciantes:


## Aula 1:

- Pragma solidity ^0.8.0; : define a versão do compilador Solidity que será usada.

- `contract HelloWorld { }`: defini o nome do contrato. Todo o código entre {} faz parte desse contrato.

- `string public message;` : foi criada uma variável pública do tipo `string`. No Solidity, variáveis públicas tem um `getter` automático, o que significa que qualquer pessoa pode ler o valor de `message`.

- `updateCount`: foi criada uma variável para contar quantas vezes a mensagem foi atualizada. 

- `constructor( ) { }`: o construtor é uma função especial que é chamada apenas 1 vez, quando o contrato é implantado na blockchain. Aqui, foi definida a mensagem inicial como "Hello, Blockchain!", bem como iniciado em "0" o contador da var updateCount.

- `function updateMessage(string memory newMessage) public { }`: esta função pública permite que qualqer pessoa atualize a mensagem armazenada no contrato. Foi usado o `memory` para indicar qua a nova mesagem é temporária e existe apenas enquanto a função é executada. Além disso, toda vez que updateMessage é chamada, o contador updateCount é incrementado em 1.


## Aula 2:

**Desafio: Crie um contrato que armazena um endereço de uma carteira Ethereum, e uma função que permite atualizar esse endereço.**

- `storageAddress`: armazena um endereço Ethereum.

- `msg.sender`: recupera o endereço de quem está chamando a função.

- `updateAddress`: permite atualizar o endereço armazenado com um novo.


## Aula 3:

**Desafio: Desenvolva um Smart Contract que seja capaz de armazenar o nome, idade e nacionalidade de uma pessoa brasileira em 3 variáveis distintas. O contrato deve dar a cada uma das variáveis, respectivamente, as visibilidades public, private e internal. Os dados da pessoa deverão ser "Isabella" para o nome, 10 para a idade e true para a nacionalidade brasileira, através do construtor. Desenvolva funções set e get necessárias, bem como funções para incrementar a idade da pessoa.**


**Declaração de Variáveis:**

- `name`: Uma variável pública que armazena o nome da pessoa. Como é pública, qualquer pessoa pode ver seu valor diretamente, sem necessidade de uma função getter.

- `age`: Uma variável privada que armazena a idade da pessoa. Variáveis privadas só podem ser acessadas dentro do contrato.

- `brazilian`: Uma variável interna que armazena um valor booleano (`true` ou `false`) indicando se a pessoa é brasileira. Variáveis internas são acessíveis apenas dentro do contrato e em contratos que herdam dele.

**Construtor:**

O construtor inicializa o contrato com os valores padrão: nome "Isabella", idade 10, e a pessoa como brasileira. O construtor é executado uma única vez, quando o contrato é implantado na blockchain.

**Funções de Setters e Getters:**

- As funções `setName` e `getName`permitem que qualquer pessoa altere o nome e a idade armazenados no contrato. A função `setName` recebe um valor string e a `setAge` recebe um valor uint (inteiro sem sinal).

- Como a variável `age` é declarada como privada (lá no início do contrato), ela não pode ser acessada diretamente fora do contrato. Assim, a função `view` permite que qualquer pessoa apenas consulte a idade atual.

- As funções `setNationalityBR` e `getNationalityBR` permitem definir e obter o valor booleano que indica se a pessoa é brasileira ou não. `setNationalityBR` recebe um parâmetro _braz (booleano) e `getNationalityBR` retorna o valor atual da variável `brazilian`.

**Função Interna para Adição:**

- A função `addValues` é uma função interna que adiciona dois valores inteiros. Como é `internal`, ela só pode ser chamada dentro deste contrato ou de contratos que herdem dele.

- O modificador `pure` significa que esta função não lê nem escreve em variáveis de estado, apenas opera sobre os parâmetros fornecidos.

**Função para Incrementar a Idade:**

A função `incrementAge` usa a função `addValues` para incrementar a idade em 1. Ela é marcada como `external`, o que significa que só pode ser chamada de fora do contrato (não de dentro).


## Aula 4:

**Contrato ScholarHistory:**

Este contrato gerencia o status de uma nota com base em um valor fornecido.

**Variável de Estado:**

A variável `gradeStatus` armazena o status da nota do aluno, como "Approved", "Reproved", etc. Como é pública, qualquer pessoa pode acessar seu valor diretamente na blockchain.

**Construtor:**

O construtor inicializa a variável `gradeStatus` com o valor padrão "empty". Isso é útil para indicar que ainda não há uma nota registrada no contrato.

**Função `updateGradeStatus`:**

- A função `updateGradeStatus` recebe um valor inteiro _value.

- O primeiro if verifica se a nota está fora do intervalo aceitável (menor que 0 ou maior que 10). Se isso ocorrer, a função define o gradeStatus como "Error".

- Caso contrário, a função compara o valor da nota:
I- Se for maior ou igual a 7, o aluno é aprovado, e o status é alterado para "Approved".
II- Se a nota for exatamente 0, o status será "Zero".
III -Para notas entre 1 e 6, o aluno é reprovado, e o status será "Reproved".

- Foi adicionada a variável `studentName` para armazenar o nome do aluno.

- A função `updateGradeStatus` recebe um segundo argumento _name para armazenar o nome do aluno.

- A função `getStudentInfo` retorna tanto o nome do aluno quanto o status da nota, para facilitar a consulta das informações.


## Aula 5:

Esse contrato inteligente chamado `Petition` armazena até três nomes em um vetor de strings. Ele também permite registrar nomes até o limite de três, verificar um nome específico pelo índice e verificar se a petição está completa (ou seja, se já foram registrados três nomes). Aqui está uma explicação detalhada do funcionamento de cada parte:

**Variáveis de Estado:**

- `string[3] private names`: Um vetor de strings de tamanho fixo (3) que armazena os nomes. A visibilidade é privada, então apenas funções dentro do contrato podem acessar essa variável.

- `uint256 public nameCount`: Um contador público que mantém o número de nomes registrados. Como ele é público, qualquer pessoa pode verificar o número de nomes sem a necessidade de uma função getter.

**Constructor:**

Inicializa o contrato definindo o `nameCount` como 0. Isso significa que nenhum nome foi registrado quando o contrato é implantado.

**Funções do Contrato:**

1- `register name`: 

- Essa função recebe um nome (string) como argumento e o armazena no vetor `names` na posição indicada por `nameCount`.

- O contrato verifica se já foram registrados três nomes com `if (nameCount < 3)` antes de adicionar um novo nome.

- Se o vetor `names` já estiver cheio (ou seja, `nameCount == 3`), a função não faz nada.

2- `getname`:

- Essa função permite que qualquer pessoa recupere um nome armazenado no vetor `names` baseado no índice fornecido (_id).

- A função verifica se o índice está dentro dos limites do vetor (menor que 3), caso contrário, retorna uma mensagem de erro "Error: index out of bounds".

3- `isPetitionFull()`: 

- Verifica se o vetor `names` está completo (ou seja, se três nomes já foram registrados).

- A função retorna `true` se `nameCount` for maior ou igual a 3, e `false` caso contrário.


## Aula 6:

Este contrato inteligente chamado `Petition` permite registrar até três nomes e associar a cada nome um status usando um `mapping`. Aqui está uma explicação detalhada de cada parte do contrato:

**Variáveis de Estado:**

- `string[3] private names`: Um vetor de strings de tamanho fixo (3) que armazena os nomes. A visibilidade é privada, então o acesso direto ao vetor não é permitido de fora do contrato.

- `uint256 public nameCount`: Um contador público que mantém o número de nomes registrados.

- `mapping(uint256 => string) public status`: Um mapeamento público que armazena o status associado a cada nome. O índice (chave) é baseado na posição no vetor `names`.

**Constructor:**

Inicializa o contrato com `nameCount` igual a 0, indicando que nenhum nome foi registrado.

**Funções do Contrato:**

1- `registerName`:

- Recebe um nome (_name) e o armazena na posição correspondente no vetor `names`, de acordo com o valor atual de `nameCount`.

- Inicializa o `status` de cada nome como `"undefined"`.

- A função verifica se o vetor ainda não está cheio (três nomes). Se estiver, o nome é registrado e `nameCount` é incrementado.

- Se o vetor `names` estiver cheio (ou seja, `nameCount == 3`), o registro do nome é interrompido.

2- `getName`:

- Permite que qualquer pessoa recupere um nome armazenado no vetor `names` com base no índice fornecido (_id).

- A função verifica se o índice está dentro dos limites do vetor (menor que 3). Se o índice for inválido, retorna a mensagem de erro `"Error: index out of bounds"`.

3- `isPetitionFull`:

Verifica se o vetor `names` está cheio, ou seja, se três nomes já foram registrados.

4- `changeStatus`:

- Permite alterar o `status` de um nome com base no seu índice (_id).

- A função verifica se o índice (_id) é válido (menor que o número de nomes registrados). Se for, atualiza o `status` associado a esse nome.

**Exemplo de Funcionamento:**

1- Registrar Nomes:

- Suponha que você registre três nomes: "Alice", "Bob" e "Carol".

- Após cada registro, o status correspondente será inicializado como `"undefined"`.

2- Alterar Status:

Depois de registrar os nomes, você pode alterar o status associado a cada um. Por exemplo:

- `changeStatus(0, "approved")` mudará o status de "Alice" para `"approved"`.

- `changeStatus(1, "pending")` mudará o status de "Bob" para `"pending"`.

**Benefícios do Design:**

- Simplicidade: O contrato mantém a lógica simples para registrar nomes e gerenciar seus status.

- Facilidade de Modificação: Funções como `changeStatus` permitem facilmente modificar o estado de cada registro de nome sem a necessidade de acessar diretamente os arrays.


## Aula 7:

O contrato `Petition` permite registrar nomes em uma petição, com um limite de três nomes armazenados em um array fixo e quaisquer nomes extras armazenados em um array dinâmico. O contrato também permite alterar o status de cada nome registrado e consultar se a petição está cheia (com pelo menos três nomes).

**Variáveis do Contrato:**

- names: Array fixo com tamanho 3 para armazenar os primeiros três nomes.

- extraNames: Array dinâmico para armazenar nomes extras além dos três primeiros.

- nameCount: Contador de quantos nomes foram registrados.

- status: Mapeamento que relaciona um ID de nome a um status (inicialmente `"undefined"`).

**Função `registerName`:**

- Armazena o nome recebido por parâmetro no array fixo `names` se o número de nomes registrados for menor que 3.

- Se já houver 3 nomes registrados, o nome é adicionado ao array dinâmico `extraNames`.

- O status do nome é definido como `"undefined"`, e o contador `nameCount` é incrementado.

**Função `getName`:**

Retorna o nome com base no ID passado. Se o ID for menor que 3, retorna o nome do array `names`. Caso contrário, retorna o nome do array `extraNames` com um ajuste de índice (subtraindo 3 para compensar os nomes fixos já registrados).

**Função `isPetitionFull`**

Retorna `true` se já houver pelo menos 3 nomes registrados, indicando que a petição está "cheia" nos seus três primeiros slots.


**Função `changeStatus`:**

Permite alterar o status de um nome registrado, verificando se o ID é válido (menor que `nameCount`).

**Exemplos de Uso:**

1- Registrar Nomes:

- Suponha que você chame a função `registerName("Alice")`, depois `registerName("Bob")`, e então `registerName("Charlie")`. Esses nomes serão armazenados no array fixo `names`.

- Se você adicionar um quarto nome, como `registerName("David")`, ele será armazenado no array dinâmico `extraNames`.

2- Recuperar Nomes:

- Para consultar o nome de ID 0 (primeiro nome registrado), você chamaria `getName(0)` e obteria `"Alice"`.

- Para consultar o quarto nome (ID 3), você chamaria `getName(3)` e obteria `"David"`.

3- Alterar Status:

Para alterar o status de um nome, você pode chamar `changeStatus(0, "approved")`. O status de `"Alice"` agora será `"approved"`.

**Observações:**

- O contrato suporta o armazenamento de um número ilimitado de nomes no array dinâmico `extraNames` além dos três primeiros.

- O mapeamento de status pode ser útil para rastrear a aprovação ou rejeição de cada participante da petição.
























     