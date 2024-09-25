// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Petition {
    string[3] private names; // vetor names

    string[] private extraNames;

    uint256 public nameCount; // var nameCount

    mapping(uint256 => string) public status;

    constructor() {
        nameCount = 0;
    }

    function registerName(string memory _name) public {
        //estou pegando o vetor 'names' e na posição desse vetor 'names',
        //indicada pela var 'nameCount', vou salvar o nome (_name) que está sendo
        //passado por parâmetro em 'registerName'.

        if(nameCount < 3) {            
            names[nameCount] = _name; // var _name
            
        } else {
            extraNames.push(_name); //push 'pendura' um dado no fim do array dinâmico
        }
        status[nameCount] = "undefined";
        nameCount++; //incrementa em 1 unidade na var memória
    }

    function getName(uint256 _id) public view returns(string memory) {
        if(_id < 3) {
            return names[_id];

        } else {
            return extraNames[_id - 3];
            // -3 pq já tem 3 nomes em names, senão o extraNames ficaria
            //sempre com 3 nomes de diferença; então, volta 3 posições
            //no array.
        }
    }       

    function isPetitionFull() public view returns(bool) {
        return nameCount >= 3;
    }

    function changeStatus(uint256 _id, string memory _status) public {
        if(_id < nameCount) {
            status[_id] = _status;
        }
    }
}