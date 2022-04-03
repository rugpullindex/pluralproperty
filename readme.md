# ⚠️ deprecated and moved to [rugpullindex/libharberger](https://github.com/rugpullindex/libharberger)
# Plural Property

The concept of Plural Property originates from the work of the Partial Common
Ownership group of the Radical Exchange movement. Through meeting regularly and
discussing the intricacies of Harberger Properties, we realized that Ethereum
and its respective standards around ERC721 tokens implicitly implement the
qualities of private property.

While, for one, there's the problem of Partial Common Property to always
gravitating towards escaping into the realm of private property [1], there's
also the issue of making ERC721 tokens work with the principles of shared
ownership.

This repository, building a plural property, or a generalized property
implementation that e.g. can take on the form of "private property", "soulbound
property" [2] or potentially even "partial common ownership", is an attempt at
trying to understand how far we can push the ERC721 standard.

## Understanding the Purpose of EIPs

Arguably, the highest goal of developing a new type of property is to create an
EIP standard that the whole world starts implementing. If e.g. the big auction
houses like Zora or Opensea could agree on just using EIP-XXX to implement
Partial Common Ownership, everyone would win as this infrastructural consensus
allows building wildly more powerful applications.

With the ERC20 and ERC721 standards, forms of fungible and non-fungible private
property have already been established as industry norms. And although it's
generally poorly understood why; the reason it had so much success is because
the respective standards created a unified interface for applications to hook
onto.

Whereas before the ERC721, every other art market platform had their own data
model for NFTs, with ERC721 suddenly everyone was able to cram their
proprietary concepts into its interface definitions.

But here's the significant distinction and why people get confused when hackers
e.g. "sleep mint" NFTs into popular artist's wallets [3]: EIP contract
interface definitions **don't** mandate implementation behavior.

Yes, e.g. the ERC721 `transferFrom(from, to, tokenId)` strongly suggests that
its calling transfers a token with the id `tokenId` `from` its sender to a
receiver (`to`). However, as developers we implicitly assume that to be the
case: We consider this behavior as "normal."

In the same vain, if e.g. someone was to disable the `transfer` functionality
of an ERC721 contract permanently, we'd consider it "unnormal." Sure, the
ERC721 definition states that for `function safeTransferFrom`: "@notice
Transfers the ownership of an NFT from one address to another address," but
really that's just a comment on the interface a machine isn't interpreting.

The implicit common understand that **obviously** `transferFrom` will literally
transfer a token, is why e.g. on OpenSea, for each NFT they have a "Transfer"
button that does exactly that.

However, OpenSea's code connects to the ERC721 standard and its variety of
implementations only through this implicit notion: Surely, in e.g. their
database, after a transfer happens from A to B for token 1, they make B the
owner of token 1.

They do so as they expect this type of behavior to be the normal implementation
of an ERC721 contract: But we're here to challenge that.

## Partial Common Ownership Hard Forks Private Property

Then, with the Partial Common Ownership working group, we wanted to port NFTs
into the PCO realm, and we realized that to do it, we'd have to disable all
transfer capabilities between addresses. But then, are we even still a
compliant ERC721 interface? Additionally, since the ownership is "partial" and
"common" (at the same time): What should `ownerOf` really return?

On one side, it could return the address of the contract that's continuously
auctioning off the property; or should it return the current highest bidder
that's self-assessing the property?

What constitutes ownership? How does it relate to possession? And how are these
two terms defined in the Harberger Property universe?

For NFT standards like the ERC721 and others; if all transfer functions must be
disabled to implement partial common ownership; and if other functions like
bidding for an auction are required to truly implement the concept: Then can we
still backfit the ERC721 standard?

## The Need To Sympathise With Wallet Maintainers

I think the key observation for finding an answer to this question is thinking
like an auction house developer or a wallet maintainer. Clearly, to establish a
new kind of ownership concept, a consensus on the property's interface methods
needs to emerge, e.g. as an EIP standard.

If we want to create the network effects around a new type of property then we
need to enable wallet implementers to build applications and so blocking the
`transferFrom` function of an ERC721 contract cannot be the solution.

E.g., since we know that with Partial Common Ownership, the property is
continuously on sale, and in a specific case, through a dutch auction, we can
already start defining interface methods useful for wallet maintainers and
auction house developers.

Instead of retrofitting the ERC721's `transferFrom` function, why don't we dare
to define a new set of functions that allow any wallet to `function bid(uint256 tokenId)` (as a means of transferring) or `function assess(uint256 tokenId, uint256 price)`?

That's the goal of the rugpullindex/pluralproperty repository: Discovering an
interface that works for creating a new form of partial and commonly owned
property: A Plural Property - both private and common.

## References

- 1: https://timdaub.github.io/2022/02/19/non-skeuomorphic-harberger-properties-erc721-nfts/
- 2: https://vitalik.ca/general/2022/01/26/soulbound.html
- 3: https://timdaub.github.io/2021/04/22/nft-sleepminting-beeple-provenance/
