// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Wallet1 {
    address payable public owner;
    address[] public owners;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 amount) external {
        require(owner == msg.sender, "wallet is not owner");

        bool isWoner = false;
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                   isWoner = true;
                break;
            }
        }
        require(isWoner, "wallet is not from  owners ");
        payable(msg.sender).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
