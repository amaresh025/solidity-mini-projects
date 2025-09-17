PiggiBank is a simple smart contract where:

Anyone can deposit ETH into the contract.

Only the owner can withdraw funds.

The contract keeps track of balances using a mapping.

⚙️ Features

Deposit ETH → Any user can send ETH to the contract.

Check Balance → Returns total ETH stored in the contract.

Withdraw → Only the owner can withdraw ETH (with safety checks).

📂 Solidity Concepts Used

mapping → To store user balances.

payable → To allow deposits and withdrawals.

require → For access control and validations.

transfer → To send ETH securely.

🧪 How to Test

Open the contract in Remix IDE.

Deploy the contract (owner will be the deployer).

Call deposit() and send ETH along with the transaction.

Use checkBalance() to see total ETH in the contract.

As the owner, call withdraw(_value) to withdraw ETH.

🎯 Learning Goal

This project helps practice:

Handling ETH in smart contracts.

Access control (owner-only functions).

Safe withdrawals with validation.
