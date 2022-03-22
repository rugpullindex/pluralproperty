// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {DSTest} from "ds-test/test.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {Counters} from "openzeppelin-contracts/utils/Counters.sol";
import {
  ERC721Holder
} from "openzeppelin-contracts/token/ERC721/utils/ERC721Holder.sol";

import {SoulboundController} from "../SoulboundController.sol";
import {PluralProperty} from "../PluralProperty.sol";

contract SoulboundProperty is ERC721, PluralProperty {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor(address _controller) ERC721("Soulbound", "SB") {
    _setController(_controller);
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


contract TestSoulbound is DSTest, ERC721Holder {
  SoulboundController sc;
  SoulboundProperty sp;

  function setUp() public {
    sc = new SoulboundController();
    sp = new SoulboundProperty(address(sc));
  }

  function testMint() public {
    uint256 tokenId = sp.safeMint(address(this));
    assertEq(tokenId, 0);
  }

  function testFailTransferFrom() public {
    uint256 tokenId = sp.safeMint(address(this));
    sp.transferFrom(address(this), address(2), tokenId);
  }

  function testFailSafeTransferFrom1() public {
    uint256 tokenId = sp.safeMint(address(this));
    sp.safeTransferFrom(address(this), address(2), tokenId);
  }

  function testFailSafeTransferFrom2() public {
    uint256 tokenId = sp.safeMint(address(this));
    bytes memory data = hex"1337";
    sp.safeTransferFrom(address(this), address(2), tokenId, data);
  }
}
