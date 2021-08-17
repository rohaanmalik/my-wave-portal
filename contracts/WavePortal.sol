pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal{
    uint totalWaves;
    mapping (address => uint) waveMap;

    constructor(){
        console.log("I am a smart contract");
    }

    function addToMap(address wallet) public {
       waveMap[wallet] += 1;
    }

    function getWavesWallet(address wallet) view public returns (uint) {
        return waveMap[wallet];
    }

    function wave() public {
       totalWaves += 1;
       console.log("%s is waved", msg.sender);
    }

    function getTotalWaves() view public returns (uint) {
        console.log("We have %d total number of waves", totalWaves);
        return totalWaves;
    }
}
