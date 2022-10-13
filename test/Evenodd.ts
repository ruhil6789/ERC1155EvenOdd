import {ethers} from "hardhat";
import { expect} from "chai";
import { EvenOdd, EvenOdd__factory, InputNFT, InputNFT__factory } from "../typechain-types";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";


describe("contracts", async() =>{

 let evenodd:EvenOdd;
 let inputnft:InputNFT;

 let owner : SignerWithAddress;
 let signers :SignerWithAddress[];

 beforeEach("comtract",async()=>{

signers = await ethers.getSigners();
owner =signers[0];

inputnft = await new InputNFT__factory(owner).deploy("name" , "symbol");
evenodd =await new EvenOdd__factory(owner).deploy(inputnft.address);

 })

it("should stake the nft", async()=>{
inputnft.connect(owner).safeMint(owner.address,1);
inputnft.connect(owner).approve(evenodd.address,1);
evenodd.connect(owner).stakeNft(1);
})
it("should not the owner",async() =>{

inputnft.connect(owner).safeMint(owner.address,1);
inputnft.connect(owner).approve(evenodd.address,1);
expect(await evenodd.connect(owner.address).stakeNft(1)).be.equal(inputnft.ownerOf(1));
console.log("assign the new owner");


})
it.only("should the token id is odd",async()=>{

    inputnft.connect(owner).safeMint(owner.address,1);
    inputnft.connect(owner).approve(evenodd.address,1);
    //console.log("1");
    await evenodd.connect(owner).stakeNft(1);
   console.log(await evenodd.connect(owner).tokenIdNo(owner.address));
    console.log("print the odd tokenID");

    expect(evenodd.connect(owner).stakeNft(2)).be.equal(1);





})


})