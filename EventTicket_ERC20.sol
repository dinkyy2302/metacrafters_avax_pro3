// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract event_tickets is ERC20, Ownable {
    constructor() ERC20("Event tickets", "ETK") Ownable(msg.sender) {}

    function a(address to, uint256 amount) public onlyOwner { // a for mint, thid function will mint the tokens 
        _mint(to, amount); 
    }

    function b(uint256 amount) public { //b for burn to burn the token by caller's aaccount
        _burn(msg.sender, amount);
    }

    function c(uint256 amount) public { // c for redeem
        require(balanceOf(msg.sender) >= amount, "user have Not enough points to redeem");
        _burn(msg.sender, amount);
    }
}
