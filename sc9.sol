// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StorageV4 {
    enum Status {
        Zero,      // 0, posição em memória
        Approved,  // 1
        Reproved,  // 2
        Undefined  // 3
    }

    struct Person {
        string name;
        uint256 age;
        bool brazilian;
        Status gradeStatus;
    }

    // Criamos um array de structs Person
    Person[] public people; // arrays fixos não suportam a função push, por ser um array dinâmico; por isso, vamos usar um array vazio para utilizar a função push


    // Função para adicionar uma pessoa ao array
    function addPerson(string memory _name, uint256 _age, bool _brazilian) public {

        people.push(
            Person({
                name: _name,
                age: _age,
                brazilian: _brazilian,
                gradeStatus: Status.Undefined
            })
        );
        

    }

    // Função para atualizar o status da nota de uma pessoa específica
    function updateGradeStatus(uint256 _id, uint256 _value) public {

        if(_value <=10 && _value >= 0) {
            if(_value >= 7) {
                people[_id].gradeStatus = Status.Approved;
            } else if(_value == 0) {
                people[_id].gradeStatus = Status.Zero;
            } else {
                people[_id].gradeStatus = Status.Reproved;
            }
        } else {
            people[_id].gradeStatus = Status.Undefined;
        }
    }

    // Função para obter as informações de uma pessoa pelo seu ID
    function getPerson(uint256 _id) public view returns (string memory, uint256, bool, string memory) {

        Person memory person = people[_id];
        string memory grade;

        // Converte o status do enum para string para exibir ao usuário
        if(person.gradeStatus == Status.Zero) {
            grade = "Zero";

        } else if(person.gradeStatus == Status.Approved) {
            grade = "Approved";

        } else if(person.gradeStatus == Status.Reproved) {
            grade = "Reproved";

        } else {
            grade = "Undefined";
        }

        return(person.name, person.age, person.brazilian, grade);
    }

    // Função para alterar informações de uma pessoa
    function updatePerson(uint256 _id, string memory _name, uint256 _age, bool _brazilian) public {

        people[_id].name = _name;
        people[_id].age = _age;
        people[_id].brazilian = _brazilian;
    }
}   