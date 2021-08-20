async function main() {
    const [owner, randoPerson] = await ethers.getSigners(); // eth address generators
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({value: hre.ethers.utils.parseEther("0.1")});
    await waveContract.deployed();
    
    let contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log("Contract balance", hre.ethers.utils.formatEther(contractBalance));
    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);
    
    let waitCount;
    waitCount = await waveContract.getTotalWaves();

    let waveTxn = await waveContract.connect(randoPerson).wave("Hey, this is Rohaan"); // a random person can wave
    await waveTxn.wait(); 

    waitCount = await waveContract.getTotalWaves();
    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);
    
    let wavesPerWallet = await waveContract.getWavesPerWallet(owner.address);
    console.log(wavesPerWallet);

    wavesPerWallet = await waveContract.getWavesPerWallet(randoPerson.address);
    console.log(wavesPerWallet);
 

    // waveTxn = await waveContract.connect(randoPerson).wave(); // a random person can wave
    // await waveTxn.wait(); 

    // let wavesForRando;
    // wavesForRando = await waveContract.getWavesWallet(randoPerson.address);
    // await wavesForRando.wait();
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });