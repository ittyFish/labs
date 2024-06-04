//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "./IUniswapV3SwapCallback .sol";

interface IUniswapRouter is ISwapRouter {
    function refundETH() external payable;
}