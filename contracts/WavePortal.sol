pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal{
    uint totalWaves;

    constructor(){
        console.log("I am a smart contract");
    }

    function waves() public {
       totalWaves += 1;
       console.log("%s is waved", msg.sender);
    }

    function getTotalWaves() view public returns (uint) {
        console.log("We have %d total number of waves", totalWaves);
        return totalWaves;
    }
}
