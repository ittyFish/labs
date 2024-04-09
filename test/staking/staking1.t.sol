// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../../src/staking/staking_1.sol";


contract stakingTest is Test {
    /// @dev Address of the SimpleStore contract.
         Staking public s;
    /// @dev Setup the testing environment.
    function setUp() public {
         s = new Staking();
       
    }



    


     
}
