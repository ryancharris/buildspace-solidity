async function main() {
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({
        value: hre.ethers.utils.parseEther("0.1")
    });
    await waveContract.deployed();
    console.log("Contract address:", waveContract.address)

    let contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log('Contract starting balance:', contractBalance.toString());

    let waveTxn = await waveContract.wave("A message!");
    await waveTxn.wait();

    contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log('Contract ending balance:', contractBalance.toString());
}

main()
    .then(() => process.exit(0))
    .catch((err) => {
        console.error(err);
        process.exit(1);
    })