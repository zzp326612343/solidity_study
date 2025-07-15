// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721 is ERC721URIStorage, Ownable {
    uint256 public _tokenId;

    constructor() ERC721("MyNFT", "MNFT") Ownable(msg.sender) {
        _tokenId = 0;
    }

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        _tokenId++;
        uint256 newTokenId = _tokenId;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        return newTokenId;
    }
}
