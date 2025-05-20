// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SampleContract {
    string public message = "Hello, Lens & zkSync!";

    function setMessage(string calldata newMessage) external {
        message = newMessage;
    }
}
