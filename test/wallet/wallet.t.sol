// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../../src/wallet/gabaim.sol";

contract walletTest is Test {
    /// @dev Address of the SimpleStore contract.
    Wallet1 public w;

    /// @dev Setup the testing environment.
    function setUp() public {
        w = new Wallet1(0x68BF2f4E4091C29dFa88B2c8bCBB65f00A63CE04,0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71,0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
        payable(address(w)).transfer(100);
    }

    // @dev Ensure that you can set and get the value.
    function testDeposit() public {
        
        uint256 beforeBalance = address(w).balance;
        payable(address(w)).transfer(15);
        uint256 afterBalance = address(w).balance;
        assertEq(afterBalance ,beforeBalance + 15, "Transfer failed");
             
    }
     function testNotAllowedWithdraw() public {
         uint256 amount1 = 50 ;
         address userAddress = vm.addr(123);
         vm.startPrank(userAddress);

         uint256 initalBalance = uint256(address(w).balance);
         vm.expectRevert();
         w.withdraw(amount1);

         uint256 finalBalance = uint256(address(w).balance);

         assertEq(initalBalance , finalBalance);
         vm.stopPrank();
    }

    function testAllowedWithdraw() public {
         uint256 amount1 = 50 ;
         address userAddress = 0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71;
         vm.startPrank(userAddress);

         uint256 initalBalance = uint256(address(w).balance);
         w.withdraw(amount1);

         uint256 finalBalance = uint256(address(w).balance);

         assertEq(initalBalance - amount1, finalBalance);
         vm.stopPrank();
    }

    function testChangeGabai() public {
        address oldGabai = 0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71;
        address newGabai = 0x7a3b914a1f0bD991BAf826F4fE9a47Bb9880d25f;
        address owner=0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;

        vm.startPrank(owner);

        w.changeOwner(oldGabai,newGabai);

        vm.expectRevert();
        w.changeOwner(oldGabai,newGabai);


        assertEq(w.gabaim(newGabai),true);
        assertEq(w.owner(),0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);
        assertEq(w.gabaim(oldGabai),false);

        vm.stopPrank();

    }

      function testNotChangeGabai() public {
        address oldGabai = 0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71;
        address newGabai = 0x7a3b914a1f0bD991BAf826F4fE9a47Bb9880d25f;
     
        address userAddress = vm.addr(123);
        vm.startPrank(userAddress);

        vm.expectRevert();
        w.changeOwner(oldGabai,newGabai);

        assertEq(w.gabaim(oldGabai),true);

        vm.stopPrank();

    }
        function testGetBalance() public {
        assertEq(w.getBalance(), 100 , "not equals");
    }
     
}
