// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Onwner{

     address private owner;

     event ownerSet(address indexed oldOwner,address indexed newOwner);


//check from a caller function if the the is the owner
//if the caller in not the owner שn error message will be displayed
     modifier isOwner() {
       require(msg.sender==owner,"caller is not owner");
       _;
     }

//Happens once in the contract layout and puts  the caller is the owner
     constructor() {
       owner  = msg.sender;
       emit ownerSet(address(0), owner);
     }


//this function change the owner 
//by sending to the ownerSet event
    function changeOwner(address newOwner)public isOwner{
        emit ownerSet(owner,newOwner);
        owner = newOwner;
    }


  //this function allows external callers to retrieve
  //the current owner of the contract without modifying any state.    
     function getOwner() external view returns(address) {
        return owner;
     }

}
