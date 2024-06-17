// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract Error{

    function requireTest(uint256 _i)public pure{
        require(_i > 10 ,"Input must be greater than 10");
    }
    function revertTest(uint256 _i) public pure{
        if(_i > 10){
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function AssereTest() public view{
        assert(num == 0);
    } 

     error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

     function testCustomError(uint256 _whithdrowAmount) public view{
        uint256 bal =address(this).balance;
        if(bal < _whithdrowAmount){
            revert InsufficientBalance({
               balance:bal,
               withdrawAmount:_whithdrowAmount
            });
        }
     }
}