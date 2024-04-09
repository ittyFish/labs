// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.20;
contract Staking  {

 address public owner;
 IERC20 public immutable stakingToken; //finall
 uint public totalSupply;

 //address=> time=>amount the user depisited
 mapping(address=>mapping(uint=>uint)) public deposit;

 mapping(address=>uint) public numOfDeposit;

  constructor() {
        owner = msg.sender;
        stakingToken = IERC20(0x127fea9Dd797E70B2BF3AdBDda7a9F324332b01f);
        totalSupply=1000000;
        stakingToken.transfer(address(this),totalSupply);
    }

  modifier reward(address user){
       require(user!=address(0),"Address does not make sense");
       _;
  }
//A function that deposits money
  function depositMoney(uint amount) external {
        require(amount>0,"The amount must be greater than 0");
        deposit[msg.sender][block.timestamp]=amount;
        stakingToken.transfer(address(this), amount);
        numOfDeposit[msg.sender]+=1;
  }
  function withdraw(uint amount)  external reward(msg.sender){
    uint anoutDowenFromContract =amount;
    require(amount>0,"The amount must be greater than 0");
    for (uint i = 0; i < numOfDeposit[msg.sender]&&amount!=0; i++) {
       uint time = deposit[msg.sender][i];
        // Check if the timestamp is valid (not 0) and if it's been more than a week
        require(block.timestamp > time + 1 weeks,"Time has not passed");
            uint depositedAmount = deposit[msg.sender][time];
            if (amount <= depositedAmount  ) {
                deposit[msg.sender][time] -= amount;
               amount=0;
            } else {
                deposit[msg.sender][time] = 0;
                amount -= depositedAmount;
            }
    }
    require(amount==0,"you cant withdraw this amount"); //amount=2000
    uint depositSupply=stakingToken.balanceOf(address(this))-totalSupply;
    uint toReward = (anoutDowenFromContract/ depositSupply)*2/100*totalSupply; //2000÷15000)×2÷100×1000000=2666
    stakingToken.transferFrom(address(this),msg.sender,toReward + anoutDowenFromContract);
    totalSupply-=toReward;
  }
function getBalance() external view returns(uint){
    return stakingToken.balanceOf(address(this));
  }
}












