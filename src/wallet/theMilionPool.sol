// // SPDX-License-Identifier: MIT
// // https://solidity-by-example.org/defi/staking-rewards/
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contract StakingRewards {
//     IERC20 public immutable stakingToken;
//     IERC20 public immutable rewardsToken;
//     address public owner;
//     // uint public duration;
//     uint public startAt;
//     uint public updatedAt;
//     // uint public rewardRate;
//     uint public rewardPerTokenStored;
//     // User address => rewardPerTokenStored per token paid
//     mapping(address => uint) public deposits;
//     // User address => rewards to be claimed/home/user/labs/src/like/IERC20.sol
//     // mapping(address => uint) public rewards;
//     // Total staked
    
//     uint256 percentOfDeposit;//percent from totalSupply
//     uint public totalSupply;
//     // User address => staked amount
//     mapping(address => uint) public startDate;

    
//     constructor(address _stakingToken, address _rewardToken) {
//         owner = msg.sender;
//         stakingToken = IERC20(_stakingToken);
//         rewardsToken = IERC20(_rewardToken);
//         totalSupply = 1000000;

//     }
    
//     receive() external payable {}


//     modifier onlyOwner() {
//         require(msg.sender == owner, "not authorized");
//         _;
//     }

//     modifier updateReward(address _account) {// צריך להבין
//         rewardPerTokenStored = rewardPerToken();
//         updatedAt = lastTimeRewardApplicable();
//         if (_account != address(0)) {
//             rewards[_account] = earned(_account);
//             userReward[_account] = rewardPerTokenStored;
//         }
//         _;
//     }

//     //  function lastTimeRewardApplicable() public view returns (uint) {
//     //     return _min(finishAt, block.timestamp);
//     // }
//     function rewardPerToken() public view returns (uint) {
//         if (totalSupply == 0) {
//             return rewardPerTokenStored;
//         }
//         return
//             rewardPerTokenStored +
//             (rewardRate * (lastTimeRewardApplicable() - updatedAt) * 1e18) /
//             totalSupply;
//     }



//     function Deposit(uint256 _amount)  external
//     //  updateReward(msg.sender) 
//      {
//          require(_amount > 0, "amount = 0");
//          stakingToken.transferFrom(msg.sender, address(this), _amount);
//          percentOfDeposit=_amount*100/(totalSupply+_amount);
//          deposits[msg.sender] += percentOfDeposit;
//          totalSupply += _amount; 
//          startDate[msg.sender]=block.timestamp;
// }

//    function withdraw() external 
// //    updateReward(msg.sender)
//    {
//     uint256 finishAt =block.timestamp;
//     require(finishAt-(startDate[msg.sender].timestamp) > 7, "reward duration not finished"); 
//     uint256  monyWithdraw=(deposits[msg.sender].percentOfDeposit*totalSupply)/100;
//     rewardsToken.transferFrom(address(this), msg.sender, monyWithdraw);
//     totalSupply -= monyWithdraw; 
// }


















//     // function lastTimeRewardApplicable() public view returns (uint) {
//     //     return _min(finishAt, block.timestamp);
//     // }
//     // function rewardPerToken() public view returns (uint) {
//     //     if (totalSupply == 0) {
//     //         return rewardPerTokenStored;
//     //     }
//     //     return
//     //         rewardPerTokenStored +
//     //         (rewardRate * (lastTimeRewardApplicable() - updatedAt) * 1e18) /
//     //         totalSupply;
//     // }
//     // function stake(uint _amount) external updateReward(msg.sender) {
//     //     require(_amount > 0, "amount = 0");
//     //     stakingToken.transferFrom(msg.sender, address(this), _amount);
//     //     balanceOf[msg.sender] += _amount;
//     //     totalSupply += _amount;
//     // }
//     // function withdraw(uint _amount) external updateReward(msg.sender) {
//     //     require(_amount > 0, "amount = 0");
//     //     balanceOf[msg.sender] -= _amount;
//     //     totalSupply -= _amount;
//     //     stakingToken.transfer(msg.sender, _amount);
//     // }
//     // function earned(address _account) public view returns (uint) {
//     //     return
//     //         ((balanceOf[_account] *
//     //             (rewardPerToken() - userReward[_account])) / 1e18) +
//     //         rewards[_account];
//     // }
//     // function getReward() external updateReward(msg.sender) {
//     //     uint reward = rewards[msg.sender];
//     //     if (reward > 0) {
//     //         rewards[msg.sender] = 0;
//     //         rewardsToken.transfer(msg.sender, reward);
//     //     }
//     // }
//     // function setRewardsDuration(uint _duration) external onlyOwner {
//     //     require(finishAt < block.timestamp, "reward duration not finished");
//     //     duration = _duration;
//     // }
//     // function notifyRewardAmount(
//     //     uint _amount
//     // ) external onlyOwner updateReward(address(0)) {
//     //     if (block.timestamp >= finishAt) {
//     //         rewardRate = _amount / duration;
//     //     } else {
//     //         uint remainingRewards = (finishAt - block.timestamp) * rewardRate;
//     //         rewardRate = (_amount + remainingRewards) / duration;
//     //     }
//     //     require(rewardRate > 0, "reward rate = 0");
//     //     require(
//     //         rewardRate * duration <= rewardsToken.balanceOf(address(this)),
//     //         "reward amount > balance"
//     //     );
//     //     finishAt = block.timestamp + duration;
//     //     updatedAt = block.timestamp;
//     // }
//     // function _min(uint x, uint y) private pure returns (uint) {
//     //     return x <= y ? x : y;
//     // }
// }
