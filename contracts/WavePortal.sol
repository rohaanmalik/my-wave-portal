pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal{

    struct Wave {
        address _address;
        string message;
        uint timestamp;
    }

    uint totalWaves;
    mapping (address => Wave[]) public waveMap;
    Wave[] allWaves;

    constructor(){
        console.log("I am a smart contract");
    }

    function addToMap(address wallet, Wave memory _wave) public {
       waveMap[wallet].push(_wave);
    }

    function getWavesWallet(address _add) view public returns (Wave[] memory) {
        uint wavesPerAddress = waveMap[_add].length;
        console.log("Wallet %s has %s number of wave", _add, wavesPerAddress);
        return waveMap[_add];
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s is waved", msg.sender);
        Wave memory _wave = Wave(msg.sender, _message, block.timestamp);
        addToMap(msg.sender, _wave);
        allWaves.push(_wave);
    }

    function getTotalWaves() view public returns (uint) {
        console.log("We have %d total number of waves", totalWaves);
        return totalWaves;
    }

    function getAllWaves() view public returns (Wave[] memory) {
        return allWaves;
    }
}
