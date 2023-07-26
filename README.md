

# DegenToken (DGN)

DegenToken is an ERC-20 compliant token built on the Ethereum blockchain. The token uses the OpenZeppelin library to implement standard ERC-20 functions and features.

## Token Details

- Token Name: Degen
- Token Symbol: DGN
- Total Supply: The total supply of Degen tokens will be determined upon deployment.

## Functionality

### Minting

The contract allows for the minting of new Degen tokens. The `mint` function can be called by anyone with the required parameters to create new tokens and add them to the balance of the specified address.

### Transfers

Token holders can transfer their Degen tokens to other addresses using the `transfer` function. This function overrides the standard ERC-20 `transfer` function to include additional checks and functionality.

### Redeeming

Token holders can redeem (burn) their Degen tokens by calling the `redeem` function. This function allows a token holder to burn a specified amount of tokens from their balance, effectively reducing the total supply.

### Balance Inquiry

To check the token balance of an account, the `balanceOf` function is provided. It returns the current balance of Degen tokens for the given address.

### Burning

In addition to the `redeem` function, the contract provides a separate `burn` function. This allows a token holder to burn a specified amount of their tokens, similar to the redeem function.

## License

This smart contract is published under the MIT License, a permissive open-source license. You can find the full text of the license in the contract source code.

**Note**: The contract address "0x90F79bf6EB2c4f870365E785982E1f101E93b906" mentioned in a comment is provided for reference only and does not represent the actual deployment address of this contract.
