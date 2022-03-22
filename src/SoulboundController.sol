// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {IPPController} from "./interfaces/IPPController.sol";

contract SoulboundController is IPPController {
  function onTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) external pure returns (bool) {
    return false;
  }
  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) external pure returns (bool) {
    return false;
  }
  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) external pure returns (bool) {
    return false;
  }
}
