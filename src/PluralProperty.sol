// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {IPPController} from "./interfaces/IPPController.sol";

abstract contract PluralProperty is ERC721 {
  IPPController controller;

  function _setController(address _controller) internal {
    controller = IPPController(_controller);
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override {
    require(controller.onTransferFrom(from, to, tokenId), "ERCXXX: Unauthorized");
    super.transferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override {
    require(controller.onSafeTransferFrom(from, to, tokenId), "ERCXXX: Unauthorized");
    super.safeTransferFrom(from, to, tokenId);
  }
  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) public virtual override {
    require(
      controller.onSafeTransferFrom(from, to, tokenId, data),
      "ERCXXX: Unauthorized"
    );
    super.safeTransferFrom(from, to, tokenId, data);
  }
}
