// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloEthereum {
    string public greeting = "Hello, Ethereum!";
    address public lastUpdatedBy;

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
        lastUpdatedBy = msg.sender;
    }

    function getLastUpdater() public view returns (address) {
        return lastUpdatedBy;
    }
}