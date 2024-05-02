// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../../src/staking/mytoken.sol";
//import "../../lib/openzeppelin-contracts/contracts/mocks/docs/governance/MyToken.sol";
 import "@hack/staking/staking_1.sol";
pragma solidity ^0.8.20;
contract StakingTest is Test {
    Staking public s;
    MyToken public token;
    function setUp() public {
        token = new MyToken();
        s = new Staking(address(token),1000000);
    }
    function depositTest() public{
        uint initialBalance = s.getBalance();
        uint amount = 120;
        token.mint(address(this),amount);
        token.approve(address(s),amount);
        s.depositMoney(amount);
        assertEq(s.getBalance() - initialBalance, amount);
    }
    function withdrawTest() public{
        uint amount = 120;
        token.mint(address(this),amount);
        token.approve(address(s),amount);
        s.depositMoney(amount);
        vm.warp(block.timestamp + 8 days);
        s.withdraw(amount);
        assertEq(s.getBalance(),0,"rtet");
    }
}
    
    