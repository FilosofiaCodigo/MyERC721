A very simple ERC721.

# Dependencies

```bash
npm install --save-dev hardhat
npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai
```

# Setup

Create a `.env` on the root of this directory and add the following envionment variables.

```bash
HARDHAT_DEPLOY_URL = https://eth-ropsten.alchemyapi.io/v2/YOURALCHEMYKEY
HARDHAT_DEPLOY_PRIVATE_KEY = YOURPRIVATEKEY
```

# Compile

```bash
npx hardhat compile
```

# Deploy

Chose your network and deploy.

```bash
npx hardhat run scripts/sample-script.js
npx hardhat run scripts/sample-script.js --network ropsten
npx hardhat run scripts/sample-script.js --network mumbai
```