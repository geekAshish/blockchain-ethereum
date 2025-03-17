const {ethers, run} = require('hardhat');

async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory(
    "SolidityStorage"
  );

  const simpleStorage = await SimpleStorageFactory.deploy();
  console.log('deployed contract to: ', simpleStorage.target)

  // what's the private key?
  // what's the rpc url?
  // You can add private key and rpc url in hardhat.config.js

  if (network.config.chainId === 4 && process.env.ETHERSCAN_API_KEY) {
    console.log('waiting for block confirmation... | here waiting for 6 blocks');
    await simpleStorage.deployTransaction.wait(6);
    await verify(simpleStorage.target, []);
  }

  // Interacting with contracts in hardhat
  const currentValue = await simpleStorage.retrieve();
  console.log(`Current value is: `, currentValue);
  
  // update the current value
  const transactionResponse = await simpleStorage.store(7);
  await transactionResponse.wait(1)
  const updateValue = await simpleStorage.retrieve();
  console.log(`Current value is: `, updateValue);


}

async function verify(contractAddress, args) {
  console.log('verifying contract...');
  try {
    await run("verify:verify", {
      address: contractAddress,
      contractArguments: args,
    })
  } catch (error) {
    if (error.message.toLowerCase().includes("already verifyed")) {
      console.log("Already verifyed");
    } else {
      console.log(e);
      
    }
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1)
  })
