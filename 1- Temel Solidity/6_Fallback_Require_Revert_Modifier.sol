// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

import "hardhat/console.sol";

contract Odemeler{

    address public owner;
    address payable public musteri;

    //Modifier
    modifier onlyOwner(){
        require(msg.sender==owner, "Sadece kontrat sahibi bakiyeyi gorebilir.");
        _;
    }

    function odemeYap() external payable{

    }

    constructor() {
        owner = msg.sender;
    }

    function bakiyeGoster() public onlyOwner view returns(uint){
        //1. Yöntem: Bakiyeyi sadece kontrat sahibi çalıştırsın.
        // if(msg.sender == owner){
        //     return address(this).balance;
        // }else{
        //     console.log("|||||| Sadece kontrat sahibi bakiyeyi gorebilir.");
        //     revert();
        // }

        //2. Yöntem: Bakiyeyi sadece kontrat sahibi çalıştırsın.
        return address(this).balance;
        
    }

    function odemeGonder() public{
        require(msg.sender==owner, "Sadece kontrat sahibi bakiyeyi gorebilir.");
        musteri=payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        musteri.transfer(1 ether);

        address payable musteri2 = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        musteri2.transfer(1.3 ether);
    }
}
