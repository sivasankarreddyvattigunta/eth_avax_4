// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {

    constructor() ERC20("Degen", "DGN") {}
     //0x90F79bf6EB2c4f870365E785982E1f101E93b906 for reference
    // Mint new tokens 
    function mint(address to, uint amount) public {
        _mint(to, amount);
    }
    //owner address:0x330c75B827643Bd2D2b0A61e3fD39f80222Ae05B
    // to Transfer tokens 
    function transfer(address to, uint amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }
     event Redeemed(address indexed account, uint amount);
    // to Redeem tokens
    function redeem(uint amount) public returns (string memory) {
        require(amount > 0, "Amount to redeem must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        emit Redeemed(msg.sender, amount);
        return "Redeem successful!";
    }

    // to Check token balance of an account
    function balanceOf(address account) public view virtual override returns (uint) {
        return super.balanceOf(account);
    }

    // to Burn tokens from sender's account
    function burn(uint amount) public {
        require(amount > 0, "Amount to burn must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    
}

