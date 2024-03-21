// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/gabaim.sol";


contract WalletTest is Test {
    Wallet1 public w;

    // Everything I need to start my test
    function setUp() public {
        w = new Wallet1();
    }

    function testWithdraw() public {
    }
}
