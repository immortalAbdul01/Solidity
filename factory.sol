//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


import "./simple.sol";

contract Factory{
    Simple[] public simpleArray;
    function createSimpleStorage() public {
        Simple simple = new Simple();
        simpleArray.push(simple);


    }
    function SimpleStore(uint256 _Index ,uint _Number) public {
simpleArray[_Index].store(_Number);
    }
    function getNumber(uint _Index) public view returns (uint256){
        return simpleArray[_Index].retrive();

    }


}