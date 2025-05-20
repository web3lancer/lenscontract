# LensContract for Web3Lancer 🚀

Welcome to the **LensContract** module! This repository contains the smart contracts powering the decentralized talent marketplace [Web3Lancer](https://github.com/web3lancer/web3lancer), with deep integration into the Lens chain and Bonsai for scalable, modular, and secure on-chain freelancing.

## ✨ What is LensContract?

LensContract is the on-chain backbone for Web3Lancer, enabling:
- **Decentralized user profiles** linked to Lens social identities
- **Secure, milestone-based escrow** for client-freelancer payments
- **On-chain reputation** and review system, extensible for Bonsai and other integrations
- **Modular contract architecture** for scalability and upgradability

## 🛠️ Contracts Overview

- `UserProfile.sol` — Connects user accounts to Lens profiles for verifiable, portable social identity
- `Escrow.sol` — Handles secure, trustless payments and milestone releases
- `Reputation.sol` — Manages transparent, manipulation-resistant on-chain reputation
- `Storage.sol` — Provides scalable storage patterns for shared contract data

## 🚀 Quick Start

1. **Install dependencies**
   ```bash
   pnpm install
   ```
2. **Compile contracts**
   ```bash
   pnpm hardhat compile
   ```
3. **Deploy to Lens Testnet**
   ```bash
   bash scripts/deploy-storage.sh
   ```

## 🔗 Full Platform

This contract suite is just one part of the [Web3Lancer](https://github.com/web3lancer/web3lancer) ecosystem. For the full-stack dApp, including frontend, backend, and cross-chain integrations, visit the main repository.

## 🤝 Contributing

We welcome PRs and issues! Please see the main repo for guidelines and community discussions.

---

<p align="center">
  <b>Web3Lancer: Empowering global talent, on-chain. 🌍✨</b>
</p>
