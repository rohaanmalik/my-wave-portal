async function main() {
    const [owner, randoPerson] = await ethers.getSigners(); // eth address generators
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();

    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);
    
    let waitCount;
    waitCount = await waveContract.getTotalWaves();

    let waveTxn = await waveContract.connect(randoPerson).wave("Hey, this is Rohaan"); // a random person can wave
    await waveTxn.wait(); 

    waitCount = await waveContract.getTotalWaves();
    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);
 

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