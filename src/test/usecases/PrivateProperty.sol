// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {Counters} from "openzeppelin-contracts/utils/Counters.sol";

import {PluralProperty} from "../../PluralProperty.sol";

contract PrivateProperty is ERC721, PluralProperty {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721("Private Property", "SB") {
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override(ERC721, PluralProperty) {
    super.transferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override(ERC721, PluralProperty) {
    super.safeTransferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) public virtual override(ERC721, PluralProperty) {
    super.safeTransferFrom(from, to, tokenId, data);
  }

  function safeMint(
    address to
  ) external returns (uint256) {
    uint256 newTokenId = _tokenIds.current();
    _safeMint(to, newTokenId);
    _tokenIds.increment();
    return newTokenId;
  }
}


