// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "./dependencies/ERC721.sol";

contract MyERC721 is ERC721 {
  using Strings for uint256;
  mapping (uint256 => string) private _tokenURIs;

  string private _baseURIextended;

  constructor(string memory name, string memory symbol)
    ERC721(name, symbol) {
  }
  
  function setBaseURI(string memory baseURI_) external {
    _baseURIextended = baseURI_;
  }

  function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
    require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
    _tokenURIs[tokenId] = _tokenURI;
  }
  
  function _baseURI() internal view virtual override returns (string memory) {
    return _baseURIextended;
  }
  
  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

    string memory _tokenURI = _tokenURIs[tokenId];
    string memory base = _baseURI();

    // If there is no base URI, return the token URI.
    if (bytes(base).length == 0) {
      return _tokenURI;
    }
    // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
    if (bytes(_tokenURI).length > 0) {
      return string(abi.encodePacked(base, _tokenURI));
    }
    // If there is a baseURI but no tokenURI, concatenate the tokenID to the baseURI.
    return string(abi.encodePacked(base, tokenId.toString()));
  }

  function mint(
    address _to,
    uint256 _tokenId,
    string memory tokenURI_
  ) external {
    _mint(_to, _tokenId);
    _setTokenURI(_tokenId, tokenURI_);
  }
}