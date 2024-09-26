// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StorageV3 {
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

    //quando eu declaro uma Person, preciso criar uma var desse tipo 
    //de dados; poderia criar várias Persons ou um array de Person
    Person public p;

    constructor() {
        p.name = "Isa";
        p.age = 10;
        p.brazilian = true;
        p.gradeStatus = Status.Undefined;
    }

    function setName(string memory _name) public {
        p.name = _name;
    }

    function setAge(uint256 _age) public {
        p.age = _age;
    }

    function setBrazilian(bool _br) public {
        p.brazilian = _br;
    }

    
    function updateGradeStatus(uint256 _value) public {
        if(_value <=10 && _value >= 0) {
            if(_value >= 7) {
                p.gradeStatus = Status.Approved;
            } else if(_value == 0) {
                p.gradeStatus = Status.Zero;
            } else {
                p.gradeStatus = Status.Reproved;
            }
        } else {
            p.gradeStatus = Status.Undefined;
        }
    }

}   