//SPDX-License-Identifier:MIT

pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface InterfaceERC721 is IERC721 {
    function safeMint(address to, uint toikenId) external;
}
