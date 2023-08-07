// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Music is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    string public baseURI;

    constructor() ERC721("MusicBlock", "MBC") {
    baseURI = "ipfs://QmWfmQ37hiAfj4cdb9xQXSegeMmME5QWwKKWmqrPP57UoR";
    }
   
    function _baseURI() internal view override returns (string memory) {
     return baseURI;
    }
    function mintNFT() public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }
    function _burn(uint256 tokenId) internal override(ERC721) {
    super._burn(tokenId);
     }

    function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721)
    returns (string memory)
    {
    require(_exists(tokenId), "Token doesn<t exist");
    return _baseURI();
    }
}

    

