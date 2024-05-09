// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ConstantSumAMM {
    uint256 public total;
    uint256 public balanceA;
    uint256 public balanceB;
    uint WAD;
    constructor (uint256 initialA,uint256 initialB){
        WAD=1e18;
        initialize(initialA ,initialB);
    }
    function initialize(uint256 initialA,uint256 initialB) private {
        require(initialA > 0 && initialB > 0, "The initialization values are incorrect");
        balanceA = initialA;
        balanceB = initialB;
        total = balanceA + balanceB;
    }
    function price() public view returns (uint256){
        require(balanceA>0 && balanceB>0,"Both token balances must be greater than zero");
        return(balanceB * WAD)/balanceA;
    }
    function tradeAToB(uint256 amountA) public{
        require(amountA > 0, "Must be greater then 0");
        require(balanceA >= amountA,"Not enough A Tokens to trade");
        balanceA -= amountA;
        uint256 amountB = (price() * amountA) / WAD;
        balanceB += amountB;
    }
    function tradeBToA(uint256 amountB) public{
        require(amountB>0, "Must be greater then 0");
        require(balanceB >= amountB,"Not enough B Tokens to trade");
        balanceB -= amountB;
        uint256 amountA= (amountB * WAD) / price();
        balanceA +=amountA;
    }
    function addLiquidity(uint256 amountA) public {
          require(amountA > 0,"Amounte must be greater than zero");
          uint256 ratio = ((balanceA * WAD) / balanceB);
          uint256  amountB = (amountA* WAD ) / ratio;
          balanceA += amountA;
          balanceB += amountB;
          total = balanceA + balanceB;
    }
    function removeLiquidity(uint256 amount) public {
        require(amount > 0 , "Must be greater then 0");
        require(amount <= total,"Must be less than or equal to the total liquidity");
        uint256 ratio = (amount * WAD) / (balanceA + balanceB);
        balanceA -= (balanceA*ratio) / WAD;
        balanceB -= (balanceB*ratio) / WAD;
        total = balanceA + balanceB;
    }
}





