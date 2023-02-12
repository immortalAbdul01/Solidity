// Send funds
// withdraw funds
// SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minimumUsd=50*1e18;
    address[] public funders;
    mapping(address=>uint256)public AddressToAmount;
    function fund () public payable{
        
        require(getConversionRate(msg.value)>=1e18,"Insufficient balance");
        funders.push(msg.sender);
        AddressToAmount[msg.sender]=msg.value;

        // address : 0x5f4ec3df9cbd43714fe2740f5e3616155c5b8419

    }
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price ,,,)=priceFeed.latestRoundData();
        // This will be the price of usd in terms of ETH
        return uint256(price*1e10);

    }
    function getVersion() public view returns(uint256) {

               AggregatorV3Interface price = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
                return price.version();
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice= getPrice();
        uint256 ethInUsd=(ethPrice*ethAmount)/1e18;
        return ethInUsd;

    }
}