// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ArrayRemoveByShifting{
    uint256[]arr;

    function remove(uint256 index) public{
       require(index < arr.length -1 ,"index out of bond");

       for(uint256 i = index;index < arr.length -1;i++){
        arr[i]=arr[1+i];
       }
       arr.pop();
    }
    function test() external{
       arr =[1,2,3,4];
       remove(2);
       //[ 1 2 4 5]
       assert(arr[0]==1);
       assert(arr[1]==2);
       assert(arr[2]==4);
       assert(arr[3]==5);
       assert(arr.length == 4);

       arr =[1];
       assert(arr.length == 0);


    }
    }