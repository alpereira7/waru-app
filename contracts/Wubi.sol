//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "./ERC721REnumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WUBI is ERC721rEnumerable, Ownable {

    // Project dependent parameters
    uint256 private constant MAX_SUPPLY = 2100;
    uint256 public constant NUM_SUBCOLLECTIONS = 10;
    uint256 public constant SUBCOLLECTION_SUPPLY = MAX_SUPPLY/NUM_SUBCOLLECTIONS;
    
    uint256 public cost = 100 ether;

    using Strings for uint256;
    string private baseURI;
    string private baseExtension = ".json";
    bool public contractPause = true;

    constructor(string memory _name, string memory _symbol, string memory _initBaseURI) 
        ERC721r(_name, _symbol, MAX_SUPPLY, SUBCOLLECTION_SUPPLY) {
            baseURI = _initBaseURI;
        }

    function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory currentBaseURI = _baseURI();
        return
            bytes(currentBaseURI).length > 0 ?
                string(abi.encodePacked(currentBaseURI, _tokenId.toString(), baseExtension)) : "";
    }
    
    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract.");
        _;
    }

    // internal
    function _baseURI() internal view virtual override returns (string memory)  {
        return baseURI;
    }

    // public
    function mint(address _to, uint256 _mintAmount) public payable callerIsUser {
        require(!contractPause, "Minting is paused.");
        require(_mintAmount > 0);
        uint256 supply = totalSupply();
        require(supply + _mintAmount <= MAX_SUPPLY, "Collecton Sold.");
        
        if (msg.sender != owner()) {
            require(msg.value >= cost * _mintAmount, "Insuficient funds.");
        }

        for (uint256 i = 1; i <= _mintAmount; i++) {
            _mintRandom(_to, 1);
        }
    }


    function walletOfOwner(address _owner) public view returns (uint256[] memory)
    {
        uint256 ownerTokenCount = balanceOf(_owner);
        uint256[] memory tokenIds = new uint256[](ownerTokenCount);
        for (uint256 i; i < ownerTokenCount; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokenIds;
    }

    // Admin functions

    function mintAtIndex(address _addressToAirdrop, uint256 _id) external onlyOwner {
        require(_id <= SUBCOLLECTION_SUPPLY, "Can't mint this ID.");
        require(_id > 0, "Can't mint ID #0.");
        _mintAtIndex(_addressToAirdrop, _id);
    }

    function unpauseRandomMint() external onlyOwner {
        _unpauseRandomMint();
    }

    function setCost(uint256 _newCost) external onlyOwner {
        cost = _newCost;
    }

    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension) external onlyOwner {
        baseExtension = _newBaseExtension;
    }

    function pause(bool _state) external onlyOwner {
        contractPause = _state;
    }

    function withdraw() external payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }
}