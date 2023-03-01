//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Casino{
    address public main;
    address payable[] public players;

    constructor (){
        main = msg.sender;
    }
    receive () external payable {
        require(msg.value == 0.000000100 ether, "invalid amount" );
        players.push(payable (msg.sender));

    }
    function getBalance () public view returns (uint ){
        require(msg.sender == main ,"You are not a main person");
        return address(this).balance;
    }
    function random() internal view returns(uint){
   return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
}
function pickWinner () public {
    require(msg.sender==main, "You are not a main person ");
    require(players.length>=3 , "Need more players");
    uint r = random();
    uint index = r%players.length;
    address payable winner ;
    winner.transfer(getBalance());
    players=new address payable[](0);


}


}
