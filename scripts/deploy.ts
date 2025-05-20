import { Wallet, Provider, types } from "zksync-ethers";
import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with address:", deployer.address);

  const SampleContract = await ethers.getContractFactory("SampleContract");
  const contract = await SampleContract.deploy();
  await contract.deployed();

  console.log("SampleContract deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
