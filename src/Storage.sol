// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Storage{

    uint256 number;


//input a value to the "number"
    function store(uint256 num) public {
        number = num;
    }

//function to return data =number from blokchain
    function retrieve() public view returns(uint256){
        return number;
    }


}
