// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {IPluralProperty} from "./interfaces/IPluralProperty.sol";

abstract contract PluralProperty is ERC721, IPluralProperty {
  function onTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public pure virtual returns (bool) {
    return true;
  }

  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public pure virtual returns (bool) {
    return true;
  }

  function onSafeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) public pure virtual returns (bool) {
    return true;
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override {
    require(onTransferFrom(from, to, tokenId), "ERCXXX: Unauthorized");
    super.transferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override {
    require(
      onSafeTransferFrom(from, to, tokenId),
      "ERCXXX: Unauthorized"
    );
    super.safeTransferFrom(from, to, tokenId);
  }
  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) public virtual override {
    require(
      onSafeTransferFrom(from, to, tokenId, data),
      "ERCXXX: Unauthorized"
    );
    super.safeTransferFrom(from, to, tokenId, data);
  }
}
