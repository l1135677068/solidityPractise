// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract NewLogic {
    address public s_implementation;
    address public owner;
    string public word; 

 constructor() {
        owner = msg.sender;
    }
    event CallSuccess();
    function changeWord() public  { 
        emit CallSuccess();
        word = "new logic";
    }

    function upgrade(address logic) public {
        require(msg.sender == owner, "not the owner");
        s_implementation = logic;
    }
}