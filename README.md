# MetaCrafter-ETH_EvmBeginner

# Introduction
This Code final Project of ETH-EVM Beginner

## MyToken
This is a Solidity smart contract that implements a basic token called MyToken. The contract allows for the minting and burning of tokens.

## License
This code is licensed under the MIT License.

## Prerequisites
Pagma Solidity version of 0.8.18 or higher

### Variables

+ `name`: A public string variable representing the name of the token.
+ `Job`: A public string variable representing the jab of the token.
+ `Salary`: A public unsigned integer variable representing the total salary of token.
+  `msg.sender`: a global variable that represents the address of the account (or smart contract) that sent the current transaction

### Mapping

+ `balances`: A mapping that associates addresses with their respective token balances. The mapping is public, allowing external parties to view token balances for specific addresses.

### Constructer
+ The constructor function initializes the state variables of the contract with the values provided as parameters during contract deployment. Additionally, it assigns the initial salary to the address that deployed the contract, setting up the initial state of the contract.
+ It takes three parameters `_name`, `_Job`, and `_Salary` 
```solidity
constructor(string memory _name, string memory _Job, uint _Salary) {
        name = _name;
        Job = _Job;
        Salary = _Salary;
        balances[msg.sender] = _Salary;
    }

```

### Functions

+ `mint(address _to, uint _value)`: A public function used to mint new tokens. It takes an address `_to` and a uint `_value` as parameters. The function increases the total salary by `_value` and adds the same amount to the token balance of the specified `_to`.
```solidity
function mint(address _to, uint _value) public {
        Salary += _value;
        balances[_to] += _value;
        
    }
```
+ `burn(address _address, uint _value)`: A public function used to burn existing tokens. It takes an address `_from` and a uint `_value` as parameters. The function decreases the total salary by `_value` and reduces the token balance of the specified `_from` by the same amount, if the balance is sufficient.
```solidity
function burn(address _from, uint _value) public {
        if(balances[_from]>=_value){
            Salary -= _value;
            balances[_from] -= _value;
        }else{
            revert("Insufficient balance");
        }
    }
```
## Usage
To use this contract, you need to deploy it on a compatible Ethereum Virtual Machine (EVM) blockchain network, such as Ethereum. Once deployed, you can interact with the contract using the provided functions.

1. **Minting**
  - Call the mint function and provide the address to which the tokens should be minted `(_to)` and the amount of tokens to mint `(_value)`.

2. **Burning**
  - Call the burn function and provide the address from which the tokens should be burned `(_from)` and the amount of tokens to burn `(_value)`.

