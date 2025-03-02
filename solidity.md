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

# Scop
variables scop inside curly brackets


* View and pure functions, when called aione, don't spend gas
* View and pure functions disallow any modification of state
* Pure functions additionally disallow you to read from blockchain state
* In pure functions 

