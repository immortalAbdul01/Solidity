// Send funds
// withdraw funds
// SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./PriceConvertor.sol";

        // address : 0x5f4ec3df9cbd43714fe2740f5e3616155c5b8419

contract FundMe{
    using PriceConvertor for uint256;
    uint256 public minimumUsd=50*1e18;
    address[] public funders;
    mapping(address=>uint256)public AddressToAmount;




    function fund () public payable{
        
        require(msg.value.getConversionRate()>=1e18,"Insufficient balance");
        funders.push(msg.sender);
        AddressToAmount[msg.sender]=msg.value;


    }function withdraw() public{
        // for loop 
        for(uint256 fundIndex=0; fundIndex<funders.length;fundIndex++ ){
            address funder= funders[fundIndex];
            AddressToAmount[funder];
        }
        // reset the array
        funders=new address[](0);
        //transfer

        payable(msg.sender).transfer(address(this).balance);
        // send 
      bool sendMssg=  payable(msg.sender).send(address(this).balance);
      require(sendMssg,"Oops it failed")

        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

   
}