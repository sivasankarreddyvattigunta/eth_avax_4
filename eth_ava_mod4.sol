// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//0x90F79bf6EB2c4f870365E785982E1f101E93b906 for reference only
contract DegenToken is ERC20 {

    constructor() ERC20("Degen", "DGN") {}

    // Mint new tokens 
    function mint(address to, uint amount) public {
        _mint(to, amount);
    }

    // to Transfer tokens 
    function transfer(address to, uint amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    // to Redeem tokens
    function redeem(uint amount) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        return true;
    }

    // to Check token balance of an account
    function balanceOf(address account) public view virtual override returns (uint) {
        return super.balanceOf(account);
    }

    // to Burn tokens from sender's account
    function burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}

