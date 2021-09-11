// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint totalWaves;
    address[] waveLog;

    constructor() {
        console.log("Hello :)");
    }

    function wave() public {
        console.log("%s is waved!", msg.sender);

        totalWaves += 1;
        waveLog.push(msg.sender);

        uint timesWaved = 0;
        for (uint256 index = 0; index < waveLog.length; index++) {
            if (waveLog[index] == msg.sender) {
                timesWaved +=1;
            }
        }

        

        displayWaveTally(msg.sender, timesWaved);
    }

    function getTotalWaves() view public returns (uint) {
        console.log("We have %d total waves", totalWaves);
        return totalWaves;
    }

    function displayWaveTally(address sender, uint timesSent) view public {
        console.log("%s has waved %d times", sender, timesSent);
    }
}