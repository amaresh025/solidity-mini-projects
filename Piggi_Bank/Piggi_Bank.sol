// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PiggiBank {
    // Contract owner (the one who deploys will be the owner)
    address public owner;

    // Mapping to track how much each user deposited
    mapping (address => uint) public balance;

    // Constructor - sets the deployer as the owner
    constructor () {
        owner = msg.sender;
    }

    // Deposit function - anyone can deposit ETH into the contract
    function deposit() public payable {
        balance[msg.sender] += msg.value; // Update the sender’s balance
    }

    // Returns the total ETH stored in the contract
    function checkBalance() public view returns (uint) {
        return address(this).balance; // Current contract balance
    }

    // Withdraw function - only the owner can withdraw ETH
    function withdraw(uint _value) public {
        require(msg.sender == owner, "You are Not owner!"); // Only owner allowed
        require(_value <= address(this).balance, "Amount exceeds balance"); // Validate amount

        balance[msg.sender] -= _value; // Update the owner’s balance
        payable(owner).transfer(_value); // Transfer ETH to owner
    }
}

