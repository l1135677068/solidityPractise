// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract Proxy {
    address public s_implementation;
    address public owner;
    string public word; 
    constructor(address implementation) {
        s_implementation = implementation;
        owner = msg.sender;
    }

    receive() external payable { }
// fallback函数，将调用委托给逻辑合约
    fallback() external payable {
        // require(msg.sender != owner, "should not the owner");
        (bool success, bytes memory data) = s_implementation.delegatecall(msg.data);
    }
}