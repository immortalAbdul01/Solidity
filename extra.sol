// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;


//Inheritance 
import "./simple.sol";
contract Extra is Simple {
    function store(uint _favNo) public override{
        favNo=_favNo+12;

    }
}