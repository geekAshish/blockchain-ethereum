const ethers = require('ethers')
const fs = require('fs')

async function main() {
  // compile them in our code
  // compile them separatly

  const provider = new ethers.provider.JsonRpcProvider(process.env.RPC_SERVER_URL);
  // const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
  const encryptedJson = fs.readFileSync('./.encryptedKey.json', "utf8");
  let wallet = new ethers.Wallet.fromEncryptedJsonSync(
    encryptedJson,
    process.env.PRIVATE_KEY_PROVIDER
  )
  wallet = await wallet.connect(provider); // connet wallet to provider

  const abi = fs.readFileSync('./SimpleStorage_sol_SimpleStorage.abi', 'utf8');
  const binary = fs.readFileSync('./SimpleStorage_sol_SimpleStorage.bin', 'utf8');

  // 1. deploy simple way
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);

  // we can pass overrides in deploy like : gasLimit, gasPrice etc.
  const contract = await contractFactory.deploy({gasLimit: 1000000000});

  // after deployment, we can wait for deployment confimation, for eg. after one block
  const transactionReciept_ = await contract.deploymentTransaction.wait(1);

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

  // use variable and function from contract file
  const currentFavouriteNumber = await contract.retrieve();
  console.log(currentFavouriteNumber, currentFavouriteNumber.toString());
  const transactionResponse = await contract.store("7");
  const transactionReciept = await transactionResponse.wait(1);
  const updatedFavouriteNumber = await contract.retrieve();
  console.log(updatedFavouriteNumber.toString());
  
  
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1)
  })

  