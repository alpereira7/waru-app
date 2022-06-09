//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./WaruNFT.sol";
import "./WaruToken.sol";

contract WaruAirdrop {

    uint256 public airdropAmount = 3000 ether;

    mapping(uint256 => bool) public airdroppedForNft;

    WaruToken   token;
    WaruNFT     nft;

    event AirdropForNftDone(address indexed owner, uint256 tokenId, uint airdropTime);

    constructor(WaruToken _token, WaruNFT _nft) {
        token   = _token;
        nft     = _nft;
    }

    function airdropForNFT(uint256[] calldata tokenIDs) public {
        uint256 tokenId;
        for(uint256 i = 0; i < tokenIDs.length ; i++) {
            tokenId = tokenIDs[i];
            require(nft.ownerOf(tokenId) == msg.sender, "Not the owner of the NFT");
            require(airdroppedForNft[tokenId] == false, "Already airdropped for this NFT.");

            token.mint(msg.sender, airdropAmount);

            airdroppedForNft[tokenId] = true;

            emit AirdropForNftDone(msg.sender, tokenId, block.timestamp);
        }
    }
}
