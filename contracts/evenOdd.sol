//SPDX-License-Identifier:MIT

pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "./ERC721.sol";
import "./InterfaceERC721.sol";
import "hardhat/console.sol";

contract evenOdd is ERC1155 {
    InterfaceERC721 public inputNFT;

    constructor(address _inputNFT) ERC1155("") {
        // RewardNft = IERC721(_rewardNft);
        // reward = IERC1155(_reward);
        inputNFT = InterfaceERC721(_inputNFT);
    }

    struct Number {
        uint tokenId;
    }

    mapping(address => Number) public tokenIdNo;

    function stakeNft(uint tokenId) public {
        require(
            inputNFT.ownerOf(tokenId) == msg.sender,
            "You are not the owner of that NFT"
        );   
        console.log("not even owner");
        inputNFT.transferFrom(msg.sender, address(this), tokenId);
        console.log("2");
        if (tokenId % 2 == 0) {
            _mint(msg.sender, 1, 1, "");
            console.log("1");
            //tokenIdNo[msg.sender].tokenId = tokenId;
        } else {
            _mint(msg.sender, 2, 1, "");
            console.log("1");
            //tokenIdNo[msg.sender].tokenId = tokenId;
        }
        tokenIdNo[msg.sender].tokenId = tokenId;
    }


    // function rewrd(uint tokenId) public {
    //     reward.balanceOf(msg.sender, tokenId);
    //     require(inputNFT.ownerOf(tokenId) == 0, "need to stake nft");
    //     if (tokenId % 2 == 0) {
    //         reward.ownerof(msg.sender, tokenIdNo[msg.sender].no);
    //     } else {
    //         reward.ownerof(msg.sender, tokenIdNo[msg.sender].no);
    //     }
    // }
}
