require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomicfoundation/hardhat-verify");

module.exports = {
  solidity: "0.8.20",
  networks: {
    baseSepolia: {
      url: process.env.BASE_SEPOLIA_RPC,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
  },
  etherscan: {
    // Blockscout needs custom config
    customChains: [
      {
        network: "baseSepolia",
        chainId: 84532,  // Base Sepolia Chain ID
        urls: {
          apiURL: "https://api-sepolia.basescan.org/api", // sometimes unavailable, I'll show alternative later
          browserURL: "https://sepolia.basescan.org",
        },
      },
    ],
    apiKey: {
      baseSepolia: "35ZS8GIXCQNAQ316CQWSMJZ5AUHAI9YBDJ", // optional for some block explorers, or use empty string ""
    },
  },
};
