// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract ConstructorContract{

    string selamla;
    address public owner;


    constructor() {
        selamla = "Merhaba Veysel";
        console.log("Hey");
        owner = msg.sender;
    }

    function selamVer() public view returns (string memory) {
        return selamla;
    }

    function setGreeting(string memory _selamla) public {
        console.log("Changing greeting from '%s' to '%s'", selamla, _selamla);
        selamla = _selamla;
    }

}
