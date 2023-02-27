//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Ownable {
address owner;
constructor (){
    owner=msg.sender;
}
modifier onlyOwner{
    require(msg.sender==owner,"You cant acess");
    _;
}

}
contract SecretValet{
    string secret ;
    constructor (string memory _secret ){
        secret=_secret;
    }
    function getSecret() public view returns(string memory){
        return secret;
    }
}
contract Main is Ownable{
 
   address secretValet;

    constructor (string memory _secret){
       SecretValet _secretValvet = new SecretValet(_secret);
       secretValet= address(_secretValvet);
        super;

    }
  
    function getSecret () public view onlyOwner returns(string memory){
       SecretValet _secretValvet = SecretValet (secretValet);
       return _secretValvet.getSecret();
    }
}