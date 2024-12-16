// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenLock {


    event Release(uint256 indexed amount, uint256 timestamp);
    event TokenLockStart(uint256 startTimestamp);

    address owner;
    address public beneficiaryAddress;
    uint256 public duration;
    uint256 public startTimestamp;
    IERC20 public token;
    constructor(address _beneficiaryAddress, uint256 _duration, IERC20 _token) {
        emit TokenLockStart(block.timestamp);
        beneficiaryAddress = _beneficiaryAddress;
        duration = _duration;
        token = _token;
        startTimestamp = block.timestamp;
    }

    function release() public {
        require(block.timestamp > startTimestamp + duration, "Lock has not expired yet.");
        uint256 amount = token.balanceOf(address(this));
        require(amount > 0, "has got the token");
        token.transfer(beneficiaryAddress, token.balanceOf(address(this)));
        emit Release(amount, block.timestamp);
    }

    function getRestTime() public view returns(uint256) {
        return block.timestamp - startTimestamp;
    }
}