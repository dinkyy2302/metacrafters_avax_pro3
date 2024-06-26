
# Event Tickets ERC20 Token

## Overview
A Solidity smart contract is used to implement "Event tickets" (ETK), an ERC20 token. It offers features for burning tokens, redeeming tokens, and minting new tokens. Additionally, ownership management is included in the contract through the use of OpenZeppelin's `Ownable} pattern.

### Contract Details

- **Token Name**: Event tickets (ETK)
- **Token Symbol**: ETK
- **Decimals**: 18

## Functions

### 1. `a`

**Functionality**: adds freshly minted tokens to the designated address.

**Parameters**:
- `to`: Address to which tokens will be minted.
- `amount`: Number of tokens to mint.

**Access**: Only the contract owner can call this function (`onlyOwner` modifier).

### 2. `b`

**Functionality**: Burns (destroys) tokens from the caller's account.

**Parameters**:
- `amount`: Number of tokens to burn.

**Access**: removes tokens from the caller's account by burning them.

### 3. `c`

**Functionality**: Redeems tokens by burning them from the caller's account.

**Parameters**:
- `amount`: Number of tokens to redeem.

**Access**: Any account can call this function to redeem their tokens, provided they have enough tokens in their balance.

**Transfer Tokens**: To transfer tokens to a different address, use the `transfer(address to, uint256 amount)} function.

**Approve Token Spending**: - To authorize another address to spend tokens on your behalf, use {approve(address spender, uint256 amount)}.
  - After that, transfer tokens from the authorized address using `transferFrom(address sender, address recipient, uint256 amount)}.

## Usage

### Interacting with the Contract

1. **Deploy the Contract**
   - Deploy the contract on a compatible Ethereum development environment like Remix.

2. **Mint Tokens**
   - As the contract owner, call the `mint` function to create new tokens and assign them to specific addresses.

   ```solidity
   function a(address to, uint256 amount) public onlyOwner {
       _mint(to, amount);
   }
   ```

3. **Burn Tokens**
   - Any token holder can burn their own tokens by calling the `b` function.

   ```solidity
   function b(uint256 amount) public {
       _burn(msg.sender, amount);
   }
   ```

4. **Redeem Tokens**
   - Token holders can redeem their tokens by calling the `c` function. This function burns the tokens from the caller's account.

   ```solidity
   function c(uint256 amount) public {
       require(balanceOf(msg.sender) >= amount, "user have Not enough points to redeem");
       _burn(msg.sender, amount);
   }

   
5.  **Transfer Tokens**:
         function transfer(address to, uint256 amount) public virtual override returns (bool) {
    //this function is basically to transfer to which account directly
        _transfer(_msgSender(), to, amount);
        return true;
    }

6. **Approve Token Spending**:
  - Use `approve(address spender, uint256 amount)` to approve another address to spend tokens on your behalf.
  - Then, use `transferFrom(address sender, address recipient, uint256 amount)` to transfer tokens from the approved address.
    
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


## Error Handling

- **Insufficient Balance**: When trying to redeem tokens (`c` function), an error will occur if the caller does not have enough tokens in their balance.

## Deployment
Make sure that Solidity version ^0.8.20 is used for contract compilation.
- Install the completed contract on a network that supports Ethereum.
Determine the proper gas caps and transaction costs in accordance with the state of the network.

## License

This contract is licensed under the MIT License.
