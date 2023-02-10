//SPDX-License-Identifier: MIT
pragma solidity 0.8.17; //^ this symbols means we can use other versions of solidity as well
// This is a version of solidity
contract Simple{
// Types of data types in solidity
//boolean uint int address bytes

uint public no = 123;
//lets declare some structs

mapping(uint=>string) public noAname;
Students public cse = Students({no:123,name:"rohan"});

// lets create some objects basically in solidity we call arrays as a struct
struct Students{
    uint no ;
    string name;
}

function changeNumber (uint _no) public {
    no=_no;
    // If we call a retrieve function inside a contract then we have to pay for gas
    // retrive();
    // The more stuff you do the more expensive the transaction will become


}
// keywords view and pure will not spend any gas as they are only available to view
function retrive ( ) public view returns(uint){
  return no;
}

//creating arrays in solidity
uint256[] public list ;

Students[] public studs;
function addStuds(uint  _no,string memory _name) public{
    studs.push(Students({no:_no,name:_name}));
    // This is mapping through the struct
    noAname[_no]=_name;
}
}