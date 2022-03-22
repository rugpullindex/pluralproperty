// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {DSTest} from "ds-test/test.sol";
import {
  ERC721Holder
} from "openzeppelin-contracts/token/ERC721/utils/ERC721Holder.sol";

import {SoulboundProperty} from "./usecases/SoulboundProperty.sol";

contract TestSoulbound is DSTest, ERC721Holder {
  SoulboundProperty sp;

  function setUp() public {
    sp = new SoulboundProperty();
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
