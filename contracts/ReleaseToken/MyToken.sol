// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyToken is ERC20{
    address owner;
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
    }

    function mint(address ads, uint256 amount) public  {
		_mint(ads, amount);
	}
}