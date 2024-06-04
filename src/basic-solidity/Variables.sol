// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract Variables {
    string public txt = "Hello";
    uint256 public num = 123;

    function doSomething() public {
        uint256 i = 456;
        uint256 timsStamp = block.timestamp;
        address sender = msg.sender;
    }
}