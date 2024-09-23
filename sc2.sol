// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AddressStorage {
    address public storeAddress;

    constructor() {
        storeAddress = msg.sender; // Armazena o endereço de quem implanta o contrato
    }

    function updateAddress(address newAddress) public {
        storeAddress = newAddress;
    }
}