// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

contract Payment{
    address payable public yatirimci;

    function odemeYap() payable public{

    }

    function bakiyeGoster() public view returns(uint){
        return address(this).balance;
    }

    function odemeGonder() public{
        yatirimci=payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        yatirimci.transfer(1 ether);

        address payable yatirimci2 = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        yatirimci2.transfer(1.3 ether);
    }
}