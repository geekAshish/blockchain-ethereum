const ethers = require('ethers')
const fs = require('fs')

async function main() {
  // compile them in our code
  // compile them separatly

  const provider = new ethers.provider.JsonRpcProvider("RPC_SERVER_URL");
  const wallet = new ethers.Wallet('PRIVATE_KEY', provider);

  const abi = fs.readFileSync('./SimpleStorage_sol_SimpleStorage.abi', 'utf8');
  const binary = fs.readFileSync('./SimpleStorage_sol_SimpleStorage.bin', 'utf8');

  // 1. deploy simple way
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);

  // we can pass overrides in deploy like : gasLimit, gasPrice etc.
  const contract = await contractFactory.deploy({gasLimit: 1000000000});

  // after deployment, we can wait for deployment confimation, for eg. after one block
  const transactionReciept = await contract.deploymentTransaction.wait(1);

  console.log("Here is the deployment transaction (transaction response):", contract.deploymentTransaction);
  console.log("Here is the transaction receipt (only if you wait):", transactionReciept);


  // 2.
  // Let's deploy with only transaction data!
  // const nonce = await wallet.getTransactionCount();
  // const tx = {
  //   nonce: nonce,
  //   gasPrice: 20000000,
  //   gasLimit: 1000000,
  //   to: null,
  //   value: 0,
  //   data: "0xBinaryData",
  //   chainId: 1337
  // }
  // // const signedTxResponse = await wallet.signTransaction(tx);
  // // if you sendTransaction it'll first sign it and then send
  // const sentTxResponse = await wallet.sendTransaction(tx);
  // await sentTxResponse.wait(1)
  // console.log(sentTxResponse);
  
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1)
  })

  