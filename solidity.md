# Full course content
https://github.com/smartcontractkit/full-blockchain-solidity-course-js

# OS : Chinlink
https://github.com/smartcontractkit/chainlink

# Solidity IDE
remix.ethereum.org

# SPDX-License-Identifier: MIT

# pragma solidity 0.8.24
- tells compiler to which version of solidity you gonna use

# contract keyword
- Create you contract object
- Inside this {} code will be the part of smart contract
contract SimpleStorage {}

# Basic Solidity Types
- https://docs.soliditylang.org/en/v0.8.27/types.html

0. String
1. Boolean
2. uint
3. int
4. address
5. bytes

uint variableName; // for int it's initialized value will be set to 0;

string name = "ashish";
bool value = false;
uint256 favNumber = 123; // default is 256, lowest 8, 16, 32, .. 256
int256 favMark = -5;
address myAddress = 0xmeta_mask_address;
bytes32 valueBytes = "cat"; // max is 32


// public variable implicitly get assigned a function that returns its value!
// The default visibility is internal
int256 public favMark = 5;

# Basic Solidity Functions
function store(uint256 _favNumber) public {
  variableName = _favNumber;
}

# JavaScript VM
- You can deploy your contract on JavaScript VM for local testing
- After deploying your contract gets an address
- Smart contracts have addresses just like our wallet accounts do

- Any time you change something on-chain, including making a new contract, it happens in a transaction
- The more "stuff" in your function the more gas it costs

# Scop
variables scop inside curly brackets


* View and pure functions, when called alone, don't spend gas
* View and pure functions disallow any modification of state
* Pure functions additionally disallow you to read from blockchain state
* In pure functions you do some math, which use over and over again, or you can implement some algorithms
* We spend gass only when we modify blockchain state
* If a gas calling funtion calls a view, pure funtion - only then it will cost gas

# The EVM : Ethereum virtual Machine
- Avalanche, Fantom, Polygon these are EVM compatible platform, we can deploy our solidity code on these blockchain


# EVM Overview

- EVM can access and store information in six places:

1. Stack
2. Memory
3. Storage
4. Calldata
5. Code
6. Logs

- calldata is temparly veriables that can't modifyed
- memory is temparly veriables that can be modifyed
- storage is permanent variables that can be modifyed

- struct, array, or mapping types need to be given these keyword


# Importing Contracts into other Contracts
- One solidity file can have multiple contracts
- import './file-path';

# Inheritance & Overrides
- is key word

# Transaction Fields
* Every transaction we send it'll have these fields
tx: transaction

- Nonce: tx count for the account
- Gas Price: price per unit of gas (in wei)
- Gas Limit: max gas that this tx can use
- To: address that the tx is sent to
- Value: amount of wei to send
- Data: what to send to the To address
- v, r, s: components of tx signature

# Payable function
- payable keyword
- smart contract can hold funds just like wallets can
- everytime we deply a contract they get a contract address nearly same as wallet address
- so both contract and wallets can hold native blockchain token like ethereum

# What is reverting?
- Undo any action before, and send remaining gas back

# Solidity Library
Examples: https://solidity-by-example.org/library/

# SafeMath
checked, unchecked

# For loop

# Transfer, send, call

# constructor

# Modifier

# Advance Solidity concepts

## Immutable and constant
constant, immutable keyword is gas effective

## Custom Errors
https://soliditylang.org/blog/2021/04/21/custom-errors/

- Instead of having require, you can create custom error
- This will save gas

