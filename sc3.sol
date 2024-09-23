// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PersonDataStorage {
    string public name;
    uint8 private age;
    bool internal brazilian;

    constructor() {
        name = "Isabella";
        age = 10;
        brazilian = true;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function setAge(uint8 _age) public {
        age = _age;
    }

    function getAge() public view returns(uint8) {
        return age;
    }

    function setNationalityBR(bool _braz) public {
        brazilian = _braz;
    }

    function getNationalityBR() public view returns(bool) {
        return brazilian;
    }

    function addValues(uint8 _value1, uint8 _value2) internal pure returns(uint8) {
        return _value1 + _value2;
    }

    function incrementAge() external {
        age = addValues(age, 1);
    }
}
