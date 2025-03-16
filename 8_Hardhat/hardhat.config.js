require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: 'hardhat',
  networks: {
    rinkbey: {
      url: process.env.RINKBEY_RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
      chainId: 4, // rinkbey chainid
    }
  },
  solidity: "0.8.28",
};
