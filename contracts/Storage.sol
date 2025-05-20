// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Storage {
    uint256 private storedNumber;
    event NumberStored(uint256 newNumber);

    constructor(uint256 initialNumber) {
        storedNumber = initialNumber;
        emit NumberStored(initialNumber);
    }

    function storeNumber(uint256 newNumber) public {
        storedNumber = newNumber;
        emit NumberStored(newNumber);
    }

    function retrieveNumber() public view returns (uint256) {
        return storedNumber;
    }
}
