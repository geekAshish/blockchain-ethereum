Chain link labs - Decentralized oracle network
https://github.com/smartcontractkit/full-blockchain-solidity-course-js

Nick szabo

# Decentralized Agreement (smart contracts)

* Smart contracts are the set of instructions executed in a decentralized way without the need for a centralized or third party intermediary.

# Difference between bitcoin and ethereum
* bitcoin is the first protocol to take this blockchain technology into limelight and take these cryptocurrencies into the main stream bitcoin is the sort of digital gold or a store of values.
* bitcoin is intentionally "turing incomplete"
* bitcoin built as store of values

* Ethereum take this blockchain technology one step further, enabling people to make smart contracts and decentralized trust minimized agreements.
* ethereum built as store of values and utility to facilitate these decentralized agreement.

* The smart contracts and decentralized applications can access and interact with the real world using something called decentralized oracle networks.


# Blockchains are intentionally walled off
Blockchain itself can't interact with and can't read or listen data from the real world, that is known as oracle problem.
everything happens, it's happens in there world.

# Blockchain Oracle
Any device that interact with the off-chain world to provide external data or computation to smart contract.

# Hybrid smart contracts
on-chain + off-chain agreement

# Dapp = decentralized application = decentralized protocols = smart contracts

# what is the value of smart contract?
Trust minimize agreement, unbreakable promises (pinky promise)

An agreement, contract, or set of instructions that is deployed on a blockchain and once it's deployed
1. it can't be altered
2. automatically executes
3. everyone sees the terms of the agreement

# what have smart contract done so far?
DeFi = Decentralized Finance
DAOs
NFTs

# Create an account on metamask
- copy the account address and search on blockchain explorer ( etherscan )

1. Transaction hash

# Gas
- A unit of computational measurement.
- The more complex your transaction is the more gas you have to pay.
- Any transaction on the blockchain comes with paying gas.
- The more people send transactions at the same time the more expensive your gas costs are
- Transaction fee = Gas Price * How much gas you used

# How do blockchain works?
- https://andersbrownworth.com/blockchain
- Genesis Block: The first block in a blockchain

# Hash
- https://andersbrownworth.com/blockchain/hash
- A unique fixed length string, meant to identify a piece of data. They are created by placing said data into a "hash function"
- ethereum uses keccak256 hashing algorithm
- Hash Algorithms : A function that computes data into a unique hash
- 

# Nonce:
- A "number used once" to find the "solution" to the blockchain problem.
- It's also used to define the transaction number for an account/address.

# Mining:
- The process of finding the "solution" to the blockchain "problem".
- In our example, the "problem" was to find a hash that starts with four zeros.
- Nodes get paid for mining blocks.

# Decentralized : Having no single point of authority

# Signing Transactions
- https://andersbrownworth.com/blockchain/public-private-keys/keys
- https://andersbrownworth.com/blockchain/public-private-keys/signatures
- Elliptic Curve Digital Signature Algorithm

## Signing a transaction:
- A "one way" process. Someone with a private key signs a transaction by their private key being hashed with their transaction data.
- Anyone can then verify this new transaction hash with your public key.

# Public Key:
1. Is derived from your private key. Anyone can "see" it, and use it to verify that a transaction came from you.

# Gas II: Block Rewards & EIP 1559
- "The more people use a chain, the more expensive It is to send transactions"
- You can set a limit on how much gas you want to spend
- https://www.youtube.com/watch?v=MGemhK9t44Q
- 

# Node
- A single instance in a decentralized network
- Any one can join the network
- Blockchains are resilient
- Blockchain nodes keep lists to the transactions that occur
- 

# Consensus
- Consensus is the mechanism used to agree on the state of a blockchain.
- 1. Chain Selection algorithms
- 2. Sybil Resistance mechanism (proof of work)

## Type of Sybil Resistance Mechanism
1. PoW (Proof of work)
2. PoS (Proof of Stack)

* How to know which blockchian is the real blockchian, bitcoin and ethereum both use Nakamoto Consensus, which is combination of PoW and longest chain rule

* Block Confirmations: The number of confirmations is the number of additional blocks added on after our transaction went through in a block.
* proof of Work uses a lot of energy


# Sybil Attack
# 51% Attack

# Proof of Stake (POS)
- Proof of stake nodes put up collateral, as a svbil resistance mechanism
- Validators
- Randomness
- Proof of stake uses much less energy
- Sharding ( Solution to the scalablity problem )
- Layer 1: Base layer blockchain implementation
- Layer 2: Any application built on top of a layer 1
- rollups ( Solution to the scalablity problem )

# For testing we can deploy our contract on JavaScript VM
Smart Contracts have addresses just like our wallet accounts do

