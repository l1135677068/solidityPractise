// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract web {
    function returnNumber() pure public returns(uint _number) {
        bool _bool = false;
        _number = 1;
    }
    // string public t = "hello web3";
    // // bool
    // bool public a = true;
    // // int 
    // int public b = -1;
    // uint c = 20220330;
    // uint256 public d = c + 1;
    // address public _adress = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    // address payable public  _adress1 = payable(_adress);
    // uint256 public balance = _adress1.balance;
    // // uint[] memory array8 = new uint[](5);
    // memory uint[]  array8 = new uint[](5);

    // // _adress1.send(uint256 111);
    // enum ActionsSet { one, two, three}
    // ActionsSet set = ActionsSet.one;
    // function enumToUnit() external   payable  returns(uint) {
    //     return uint(set);
    // }
 
    // uint public number = 1;
    // function addPure(uint256 number) external pure    returns (uint256) {
    //     return number + 1;
    // }
    // 内部调用的函数
    // function internalMinus() internal  {
    //     number = number - 1;
    // }
    // function test() external  {
    //     internalMinus();
    // }
    // uint256 public number = 1;
    // function payContract() external payable  {
    //     // internalMinus();
    //     balance = address(this).balance;
    //     // return balance;
    // }
    // uint[] public number = [1, 2, 3];
    // function test() public view{
    //     uint[] memory xStorage = number;
    //     // xStorage[0] = 22;
    // }
    // uint[]  public array8 = new uint[](5);
    // bytes  public array9 = new bytes(9);
}