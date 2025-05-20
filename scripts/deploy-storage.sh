#!/bin/bash
# Usage: bash scripts/deploy-storage.sh
# This script prepares and deploys the Storage contract to Lens Testnet using zkSync Hardhat

npm run hardhat deploy-zksync --script deploy-storage.ts --network lensTestnet
