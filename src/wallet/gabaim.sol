// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/console.sol";

contract Wallet1 {
    address payable public owner;
    mapping(address => bool) public gabaim;

    constructor(
        address gabai1,
        address gabai2,
        address gabai3
    ) {
        owner = payable(msg.sender);
        console.log(address(owner));
        gabaim[gabai1] = true;
        gabaim[gabai2] = true;
        gabaim[gabai3] = true;
    }

    receive() external payable {}

    function withdraw(uint256 amount) external {
        require(
            owner == msg.sender || gabaim[msg.sender] == true,
            "wallet is not owner or an allow user "
        );
           require( amount <= address(this).balance,"You don't have enough money in your account");
        payable(msg.sender).transfer(amount);
       
    }

    function changeOwner(address oldAddress, address newAddress) external {
        require(owner == msg.sender, "only owner can change gabaim");
        require(gabaim[oldAddress]==true,"not exist this address");
        require(gabaim[newAddress]==false," exist this address");
        gabaim[oldAddress]=false;
        gabaim[newAddress]=true;

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}