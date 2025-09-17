// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PiggiBank {
    // Contract ka owner (jo deploy karega wo owner banega)
    address public owner;

    // Mapping to track user balances (kisne kitna deposit kiya)
    mapping (address => uint) public balance;

    // Constructor - deploy hone par owner set hoga
    constructor () {
        owner = msg.sender;
    }

    // Deposit function - koi bhi apna ETH contract me deposit kar sakta hai
    function deposit() public payable {
        balance[msg.sender] += msg.value; // User ka balance update ho jayega
    }

    // Contract ka total ETH balance check karne ke liye
    function checkBalance() public view returns (uint) {
        return address(this).balance; // Contract ke andar kitna ETH pada hai
    }

    // Withdraw function - sirf owner hi withdraw kar sakta hai
    function withdraw(uint _value) public {
        require(msg.sender == owner, "You are Not owner!"); // Sirf owner allowed
        require(_value <= address(this).balance, "amount is out of range"); // Amount valid hai ya nahi

        balance[msg.sender] -= _value; // Owner ka balance update hoga
        payable(owner).transfer(_value); // ETH transfer owner ke account me
    }
}
