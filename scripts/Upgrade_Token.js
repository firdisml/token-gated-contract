const {ethers,upgrades} = require("hardhat");

const PROXY = "";

async function main() {
    const Token = await ethers.getContractFactory("Token")
    await upgrades.upgradeProxy(PROXY, Token) 
}
main();