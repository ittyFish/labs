// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract DataLocations{
 uint256 [] arr;
 mapping(uint256=>address) map;

 struct MyStruct{
    uint256 foo;
 }

 mapping(uint256=>MyStruct)myStruct;

function f()public{
    _f(arr,map,myStruct[1]);

    MyStruct storage myS = myStruct[1];
    MyStruct memory mySt = MyStruct(0);

}
 function _f(uint256[] storage _arr,mapping(uint256=>address) storage _map,MyStruct storage _myStruct)internal{

 }

 function g(uint256[] memory arr) public returns(uint256[]memory){}

 function h(uint256[] calldata arr)external{}
}