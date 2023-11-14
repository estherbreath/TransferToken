# TransferToken Contract Overview


Overview: TransferToken Contract

The TransferToken contract is a basic ERC-20 token implemented on the Ethereum blockchain,
facilitating the creation and transfer of custom tokens.
It extends the functionality of the OpenZeppelin ERC-20 and Ownable contracts.
The contract is designed to be owned by a single address, 
granting exclusive minting privileges to the owner.

Key Features:

- Minting:
The contract includes a minting function (mint) that allows
the owner to generate new tokens and assign them to a specified address.
This feature provides flexibility for token issuance and distribution.

- Transfer Function with Checks:
The transfer function overrides the ERC-20 standard transfer function,
 incorporating additional security checks using require, assert, and revert statements.
 These checks include verifying the sender's balance,
 preventing transfers to the zero address, and ensuring
 that the transfer does not result in an overflow.

### Deployment and Interaction

Authors
Esther Breath @metacraftersio

License
This project is licensed under the MIT License
