// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.24;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../../src/wallet/gabaim.sol";

contract walletFuzzTest is Test {
    /// @dev Address of the SimpleStore contract.
    Wallet1 public w;

     function setUp() public {
          w = new Wallet1(0x68BF2f4E4091C29dFa88B2c8bCBB65f00A63CE04,0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71,0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
        payable(address(w)).transfer(10000);
    }


    // function testFuzz_Withdraw(uint8 amount) public {
    //     console.log(amount);
    //   // payable(address(w)).transfer(amount);
    //     uint256 preBalance = address(this).balance;//100
    //     w.withdraw(amount);
    //     uint256 postBalance = address(this).balance;//0
    //     assertEq(preBalance , postBalance + amount,"noe eq");
    // }

      function fuzztest_receive(uint88 amount) public{
       console.log(amount);
        uint256 preBalance = address(this).balance;//100
        payable(address(w)).transfer(amount);
         uint256 afterBalance = address(this).balance;//100
          assertEq(preBalance +amount , afterBalance ,"noe eq");

    }

     
}

    
    
    