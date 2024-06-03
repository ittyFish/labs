// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/wallet/wallet.sol";


contract walletTest is Test {
    /// @dev Address of the SimpleStore contract.
    Wallet1 public w;

    /// @dev Setup the testing environment.
    function setUp() public {
        w = new Wallet1(0x68BF2f4E4091C29dFa88B2c8bCBB65f00A63CE04,0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71,0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
        payable(address(w)).transfer(100);
    }

    function testDeposit() public {
    }

    function testWithdraw() public {
    }
}
