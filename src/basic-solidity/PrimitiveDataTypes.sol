// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract Primitives{

    bool public boo = true;
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint256 public u =123;

    int8 public i = -1;
    int256 public i256 = 456;
    int256 public i1 = -123;

    int256 public maxInt = type(int256).max;
    int256 public minInt = type(int256).min;

    address public addrr =0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    bool public defaultBool;
    uint256 public defaultUint;
    int256 public defaultInt;
    address public defaultAdrress;


}