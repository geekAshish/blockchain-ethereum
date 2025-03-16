const {ethers} = require('hardhat');

async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory(
    "SolidityStorage"
  );

  const simpleStorage = await SimpleStorageFactory.deploy();
  console.log(simpleStorage.target)

  // what's the private key?
  // what's the rpc url?
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1)
  })
