// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract myMapping{
    mapping (address => uint256) myMap;

    function get(address _adrr) public view returns(uint256){
        return myMap[_adrr];
    }

    function set(address addr,uint256 i) public{
        myMap[addr]=i;
    }
     function remove(address _adrr) public{
        delete myMap[_adrr];
    }

}

contract NestedMapping{
    mapping(address => mapping(uint256 => bool)) nested;

    function get(address addr, uint256 i)public view returns(bool){
        return nested[addr][i];
    }
     function set(address addr, uint256 i,bool b)public {
         nested[addr][i] = b;
    }
    function remove(address addr,uint256 i) public {
        delete nested[addr][i];
    }

}