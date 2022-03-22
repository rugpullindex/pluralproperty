// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

interface IPPController {
  function onTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) external returns (bool);
  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) external returns (bool);
  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) external returns (bool);
}
