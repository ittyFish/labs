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
    }

      function fuzztest_receive(uint88 amount) public{
       console.log(amount);
        uint256 preBalance = address(this).balance;//100
        payable(address(w)).transfer(amount);
         uint256 afterBalance = address(this).balance;//100
          assertEq(preBalance +amount , afterBalance ,"noe eq");

    }

    function testFuzz_AllowWithdraw(uint8 amount) public {
      address userAddress = 0x68BF2f4E4091C29dFa88B2c8bCBB65f00A63CE04;
      vm.startPrank(userAddress);
      vm.deal(userAddress , amount);
      payable(address(w)).transfer(amount);
      uint beforeBalance = address(w).balance;
      w.withdraw(amount);
      uint afterBalance =  address(w).balance;
      assertEq(beforeBalance -amount , afterBalance);
      vm.stopPrank();
    }
        function testWithDrawNoMoney(uint256 amount) external {
        console.log(amount, " with draw amount");
        address userAddress = 0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71; // address of allowed user
        vm.startPrank(userAddress); // send from user address
        if(amount!= 0){
            vm.expectRevert();
        }
        w.withdraw(amount);
        vm.stopPrank();
    }
        function testNotAllowedWithDraw(uint256 amount) external {
        console.log(amount, " with draw amount");
         address userAddress = vm.addr(1);
        vm.startPrank(userAddress); // send from user address
        vm.deal(userAddress, amount); 
        payable(address(w)).transfer(amount); // move amount to the contract
        vm.expectRevert();
        w.withdraw(amount);
        vm.stopPrank();
    }

    
    function testUpdateCollectors(address oldGabai, address newGabai) public {
        address ownerAddress = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496; // address of owner user
        vm.startPrank(ownerAddress); // send from owner address
        console.log(address(msg.sender));
        if(w.gabaim(oldGabai)!=true){
            vm.expectRevert();       
        }    
        w.changeOwner(oldGabai, newGabai);
        vm.stopPrank();  
    }
}




    
    
    