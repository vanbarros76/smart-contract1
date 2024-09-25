// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Petition {
    string[3] private names; // vetor names

    uint256 public nameCount; // var nameCount

    constructor() {
        nameCount = 0;
    }

    function registerName(string memory _name) public {
        //estou pegando o vetor 'names' e na posição desse vetor 'names',
        //indicada pela var 'nameCount', vou salvar o nome (_name) que está sendo
        //passado por parâmetro em 'registerName'.

        if(nameCount < 3) {
            names[nameCount] = _name; // var _name
            nameCount++; //incrementa em 1 unidade na var memória
        }
    }

    function getName(uint256 _id) public view returns(string memory) {
        if(_id < 3) {
            return names[_id];

        }
        return "Error: index out of bounds";
    }       

    function isPetitionFull() public view returns(bool) {
        return nameCount >= 3;
    }
}