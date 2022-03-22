// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import {DSTest} from "ds-test/test.sol";
import {
  ERC721Holder
} from "openzeppelin-contracts/token/ERC721/utils/ERC721Holder.sol";

import {PrivateProperty} from "./usecases/PrivateProperty.sol";

contract TestPrivateProperty is DSTest, ERC721Holder {
  PrivateProperty pp;

  function setUp() public {
    pp = new PrivateProperty();
  }

  function testMint() public {
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(tokenId, 0);
  }

  function testTransferFrom() public {
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.transferFrom(address(this), address(1), tokenId);
    assertEq(pp.ownerOf(tokenId), address(1));
  }

  function testFailTransferFromUnauthorizedUser() public {
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.transferFrom(address(this), address(1), tokenId);
    assertEq(pp.ownerOf(tokenId), address(1));

    pp.transferFrom(address(this), address(1), tokenId);
  }

  function testSafeTransferFrom1() public {
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.safeTransferFrom(address(this), address(1), tokenId);
    assertEq(pp.ownerOf(tokenId), address(1));
  }

  function testFailSafeTransferFrom1UnauthorizedUser() public {
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.safeTransferFrom(address(this), address(1), tokenId);
    assertEq(pp.ownerOf(tokenId), address(1));

    pp.safeTransferFrom(address(this), address(1), tokenId);
  }

  function testSafeTransferFrom2() public {
    bytes memory data = hex"1337";
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.safeTransferFrom(address(this), address(1), tokenId, data);
    assertEq(pp.ownerOf(tokenId), address(1));
  }

  function testFailSafeTransferFrom2UnauthorizedUser() public {
    bytes memory data = hex"1337";
    uint256 tokenId = pp.safeMint(address(this));
    assertEq(pp.ownerOf(tokenId), address(this));
    pp.safeTransferFrom(address(this), address(1), tokenId, data);
    assertEq(pp.ownerOf(tokenId), address(1));

    pp.safeTransferFrom(address(this), address(1), tokenId, data);
  }
}
