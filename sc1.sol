// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorld {
    string public message;
    uint public updateCount;

    constructor() {
        message = "Hello, Blockchain!";
        updateCount = 0;
    }

    function updateMessage(string memory newMessage) public {
        message = newMessage;
        updateCount++;
    }
}