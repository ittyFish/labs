// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
contract MyToken is ERC20 , ERC20Permit{
    constructor() ERC20("MyToken", "MIT") ERC20Permit("MyToken"){
        this;
    }
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}