// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScholarHistory {
    string public gradeStatus;
    string public studentName;

    constructor() {
        gradeStatus = "empty";
        studentName = "unknown";
    }

    function updateGradeStatus(uint8 _value, string memory _name) public {
        require(bytes(_name).length > 0, "Name cannot be empty");

        studentName = _name;

        if(_value < 0 || _value > 10) {
            gradeStatus = "Error";
        } else if(_value >= 7) {
            gradeStatus = "Approved";
        } else if(_value == 0) {
            gradeStatus = "Zero";
        } else {
            gradeStatus = "Reproved";
        }
    }

    function getStudentInfo() public view returns(string memory, string memory) {
        return(studentName, gradeStatus);
    }

    function resetStudentName() public {
        studentName = "unknown";
        gradeStatus = "empty"; 
    }
}