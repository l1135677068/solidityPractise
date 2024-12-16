// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract Caller {
    
    address public proxy;

    constructor (address _proxy) {
        proxy = _proxy;
    }

    function changeWord() public   {
        proxy.call(abi.encodeWithSignature("changeWord()"));
    }

     function upgrade() public   {
        proxy.call(abi.encodeWithSignature("upgrade(address)"));
    }
}