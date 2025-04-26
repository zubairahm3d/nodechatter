# 🛡️ NodeChatter

NodeChatter is a blockchain-based chatting system built on the Base Sepolia testnet, featuring:
- **Public Chatroom** where anyone can post on-chain messages.
- **Private Wallet-to-Wallet Chat** system to send direct messages between Ethereum addresses.

This repository contains two Solidity smart contracts:
- `PublicChat.sol`
- `PrivateChat.sol`

## 📜 Smart Contract Descriptions

| Contract Name | Purpose |
|:--------------|:--------|
| **PublicChat.sol** | Allows any user to post a public message. All messages are stored permanently on-chain. |
| **PrivateChat.sol** | Allows a wallet to send a private message to another wallet address (data is still public but targeted). |

## 🚀 Getting Started

Follow these steps to clone, set up, deploy, and verify the contracts.

### 📥 1. Clone the Repository

```bash
git clone https://github.com/zubairahm3d/nodechatter.git
cd nodechatter
```

### 🛠️ 2. Install Dependencies

Ensure you have Node.js and npm installed.

```bash
npm install
```

Installed major packages:
- hardhat
- ethers
- dotenv
- @nomicfoundation/hardhat-toolbox
- @nomicfoundation/hardhat-verify

### 🧪 3. Compile Contracts

```bash
npx hardhat compile
```

✅ This will compile PublicChat.sol and PrivateChat.sol.

### 🔐 4. Configure Environment Variables

Create a .env file at the root:

```bash
touch .env
```

Add the following:

```env
PRIVATE_KEY=your_wallet_private_key_without_0x
BASE_SEPOLIA_RPC=https://sepolia.base.org
```

- Use a test wallet (never use your real/private main wallet).
- Use Base Sepolia Faucet to get free test ETH.

### 🚀 5. Deploy to Base Sepolia

Deploy PublicChat:

```bash
npx hardhat run scripts/deployPublicChat.js --network baseSepolia
```

Deploy PrivateChat:

```bash
npx hardhat run scripts/deployPrivateChat.js --network baseSepolia
```

✅ After deployment, Hardhat will print the deployed contract addresses.

Save the addresses! Example:

```
PublicChat deployed to: 0x8EDf39464b713343a4476173A83E75BC3c8b60Fc
PrivateChat deployed to: 0x14BD0317cb6c40441bdBA9dA766cb95E74099d8F
```

### 📝 6. Verify Contracts

Once deployed, you can verify your contract source code to Basescan.

Command to verify:

```bash
npx hardhat verify --network baseSepolia 0xYourDeployedContractAddress
```

Example:

```bash
npx hardhat verify --network baseSepolia 0x8EDf39464b713343a4476173A83E75BC3c8b60Fc
```

✅ Make sure:
- Compiler version = 0.8.20
- Optimizer = Enabled (runs = 200)

If auto verification fails:
You can manually verify using https://sepolia.basescan.org ➔ "Verify and Publish" button.

## 📋 Project Structure

```
nodechatter-smartcontracts/
├── contracts/
│    ├── PublicChat.sol
│    ├── PrivateChat.sol
├── scripts/
│    ├── deployPublicChat.js
│    ├── deployPrivateChat.js
├── .env
├── hardhat.config.js
├── package.json
├── README.md
```

## 📢 Important Notes

- Messages on blockchain are public by nature — even "private" wallet-to-wallet chats are stored publicly.
- Gas Fees apply for every message post (even on testnet).
- Make sure you have enough Base Sepolia ETH.

## ⚡ Quick Commands

| Purpose | Command |
|:--------|:--------|
| Install dependencies | `npm install` |
| Compile contracts | `npx hardhat compile` |
| Deploy PublicChat | `npx hardhat run scripts/deployPublicChat.js --network baseSepolia` |
| Deploy PrivateChat | `npx hardhat run scripts/deployPrivateChat.js --network baseSepolia` |
| Verify contract | `npx hardhat verify --network baseSepolia 0xYourAddress` |

## 🌐 Useful Links

- [Basescan Explorer](https://sepolia.basescan.org/)

## 📜 License

This project is licensed under the MIT License.