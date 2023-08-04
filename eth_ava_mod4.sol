// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {

    struct Prize {
        uint cost;
        string name;
    }

    // Mapping to store available prizes and their costs
    mapping(uint => Prize) public prizes;

    constructor() ERC20("Degen", "DGN") {
        prizes[1] = Prize(1000, "Prize 1");
        prizes[2] = Prize(2000, "Prize 2");
        prizes[3] = Prize(5000, "Prize 3");
    }

    // Mint new tokens 
    function mint(address to, uint amount) public {
        _mint(to, amount);
    }

    // Transfer tokens 
    function transfer(address to, uint amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    event Redeemed(address indexed account, uint prizeId, string prizeName);

    // Redeem tokens for a prize
    function redeem(uint prizeId) public returns (string memory) {
        require(prizeId > 0 && prizeId <= 3, "Invalid prize selection");
        uint cost = prizes[prizeId].cost;
        require(cost > 0, "Invalid prize selection");

        require(balanceOf(msg.sender) >= cost, "Insufficient balance");

        // Deduct the cost from the sender's account
        _burn(msg.sender, cost);

        // Emit the Redeemed event
        emit Redeemed(msg.sender, prizeId, prizes[prizeId].name);

        // Return a success message
        return "Redeem successful!";
    }

    // Check token balance of an account
    function balanceOf(address account) public view virtual override returns (uint) {
        return super.balanceOf(account);
    }

    // Burn tokens from sender's account
    function burn(uint amount) public {
        require(amount > 0, "Amount to burn must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}
