// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "./WaruNFT.sol";
import "./WaruToken.sol";

contract WaruClaimWTC is Ownable{
    uint256 public waruRewards = 500000000000000000000;

    mapping(address => bool) public rewardsReceivedOnAddress;
    mapping(uint256 => bool) public rewardsReceivedForNft;

    WaruNFT nft;
    WaruToken token;

    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract.");
        _;
    }

    constructor(WaruNFT _nft, WaruToken _token) {
        nft = _nft;
        token = _token;
    }

    function claimRewards() external callerIsUser {
        require(nft.balanceOf(msg.sender) > 0, "Doesn't own NFT");
        require(rewardsReceivedOnAddress[msg.sender] == false, "Address already claimed.");

        uint256 counter = 0;
        
        for(uint256 i = 1; i <= nft.totalSupply(); i++) {
            if(nft.ownerOf(i) == msg.sender) {
                if(rewardsReceivedForNft[i] == false) {
                    counter++;
                    rewardsReceivedForNft[i] = true;
                }
            }
        }

        require(counter > 0, "NFT already been used to claim.");

        token.transfer(msg.sender, waruRewards);
        rewardsReceivedOnAddress[msg.sender] = true;
    }

    // Admin functions
 
    function setRewardAmount(uint256 _waruPerWallet) external onlyOwner {
        waruRewards = _waruPerWallet;
    }

    function resetRewards() external onlyOwner {
        require(nft.totalSupply()*waruRewards <= token.balanceOf(address(this)), "Not enough tokens in the contract.");
        for(uint256 i = 1; i <= nft.totalSupply(); i++) {
            rewardsReceivedForNft[i] = false;
            address addr = nft.ownerOf(i);
            rewardsReceivedOnAddress[addr] = false;
        }
    }
    
    function stopRewards() external onlyOwner {
        for(uint256 i = 1; i <= nft.totalSupply(); i++) {
            rewardsReceivedForNft[i] = true;
            address addr = nft.ownerOf(i);
            rewardsReceivedOnAddress[addr] = true;
        }
    }

    function withdrawTokens(uint256 _amount) external onlyOwner {
        token.transfer(msg.sender, _amount);
    }
    
    function withdraw() public payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }
}