pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal{
    uint totalWaves;
    mapping (address => uint) public waveMap;

    constructor(){
        console.log("I am a smart contract");
    }

    function addToMap(address wallet) public {
       waveMap[wallet] += 1;
    }

    function getWavesWallet(address _add) view public returns (uint) {
        uint waves = waveMap[_add];
        console.log("Wallet %s has %s number of wave", _add, waves);
        return waveMap[_add];
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s is waved", msg.sender);
        addToMap(msg.sender);
    }

    function getTotalWaves() view public returns (uint) {
        console.log("We have %d total number of waves", totalWaves);
        return totalWaves;
    }
}
