// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract Functions{

function returnMulti()public pure returns(uint256,bool,uint256){
    return(1,true,2);
}
function named()public pure returns(uint256 x,bool y,uint256 z){
    return(1,true,2);
}
function assigned()public pure returns(uint256 x,bool y,uint256 z){
     x =1;
     y = true;
     z = 2;
}
function destructuringAssignmentsassigned()
public pure returns(uint256 ,bool ,uint256 ,uint256,uint256){
    (uint256 i,bool j,uint256 o) = returnMulti();
    (uint256 x,,uint256 y)=(4,5,6);
    return(i,j,o,x,y);
}
function arrayInput(uint256[] memory arr) public {}

uint256[]arr;
function arratOutput()public view returns(uint256[] memory){
    return arr;
}
}
contract XYZ{
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns(uint256){}

    function callFuncWithKeyValue() external pure returns(uint256){
        return someFuncWithManyInputs({
          a:address(0),
          b:true,
          c:"c",
          x:1,
          y:2,
          z:3
    });
}
}




