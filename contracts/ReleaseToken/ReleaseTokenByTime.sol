// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract ReleaseToken {
    mapping (address => uint256) public erc20Released ; // 已经领取的代币数量
    address beneficiaryAddress; // 受益人地址
    uint256 public startTimestamp; // 起始时间戳
    uint256 public duration; // 归属期时间，单位秒
    address public tokenAddress; // 代币地址
    uint256 public maxTokenAmount;
    event ERC20TokenRelease(uint256 indexed tokenAmount, address ads );
    constructor(address _beneficiaryAddress, uint256 _duration, address _tokenAddress, uint256 _maxTokenAmount) {
        require(_beneficiaryAddress != address(0), "_beneficiaryAddress is null;");
        beneficiaryAddress = _beneficiaryAddress;
        startTimestamp = block.timestamp;
        duration = _duration;
        tokenAddress = _tokenAddress;
        maxTokenAmount = _maxTokenAmount;
    }


   // 当前时间可以最大提取多少代币
    function calculateTokenAmount(uint256 timestamp) public view returns(uint256) {
        if (timestamp < startTimestamp) {
            return 0;
        } else if (timestamp >= startTimestamp + duration) {
            return maxTokenAmount;
        } else {
            return (maxTokenAmount * (timestamp - startTimestamp)) / duration;
        }
    }

    // 受益人提取代币
    function release() public {
        require(msg.sender == beneficiaryAddress, "not the beneficiaryAddress");
        uint256 tokenAmount = calculateTokenAmount(block.timestamp) - erc20Released[tokenAddress];
        require(tokenAmount > 0, "get the max amount token");
        emit ERC20TokenRelease(tokenAmount, beneficiaryAddress);
        erc20Released[tokenAddress] += tokenAmount;
        // 转账
        IERC20(tokenAddress).transfer(beneficiaryAddress, tokenAmount);
    }
}