# Full course content
https://github.com/smartcontractkit/full-blockchain-solidity-course-js

# Solidity IDE
remix.ethereum.org

# contract keyword
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
* In pure functions 

