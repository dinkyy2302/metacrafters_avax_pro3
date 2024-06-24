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

    function transfer(address to, uint256 amount) public virtual override returns (bool) {//this function is basically to transfer to which account directly
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        //this account will ask user to prompt the user to add input
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
        return true;
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        //to approve all the transactions
        _approve(_msgSender(), spender, amount);
        return true;
    }
}
