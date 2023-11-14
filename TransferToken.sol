// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TransferToken is ERC20, Ownable {
    // Constructor
     constructor() ERC20 ("TransferToken", "TRF") Ownable(msg.sender) {
       
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to transfer tokens with require, assert, and revert statements
    function transfer(address to, uint256 amount) public override returns (bool) {
        // Require: Ensure the sender has enough balance
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        // Revert: Ensure the receiver's address is not the zero address
        require(to != address(0), "Transfer to the zero address");

        // Assert: Ensure the transfer doesn't result in an overflow
        uint256 initialBalanceSender = balanceOf(msg.sender);
        uint256 initialBalanceReceiver = balanceOf(to);
        _transfer(msg.sender, to, amount);
        assert(balanceOf(msg.sender) == initialBalanceSender - amount);
        assert(balanceOf(to) == initialBalanceReceiver + amount);

        return true;
    }
}
