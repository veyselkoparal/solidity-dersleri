// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

contract Lottery{
    address public manager;
    address payable[] public players;

    constructor() {
        manager=msg.sender;
    }

    modifier onlyManager(){
        require(msg.sender==manager, "Only manager can call this function!");
        _;
    }

    //Events
    event playerInvested(address player, uint amount);
    event winnerSelected(address winner, uint amount);


    //Invest Money
    function invest() payable public{
        require(msg.sender!=manager, "Manager can not invest!");
        //limit
        require(msg.value==3 ether, "Invest only 3 ether");
        players.push(payable(msg.sender));
        emit playerInvested(msg.sender, msg.value);
    }

    //Bakiyeyi gör
    function getBalance() public view onlyManager returns(uint){
        return address(this).balance;
    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players.length)));
    }

    function selectWinner() public onlyManager{
        uint r=random();
        uint index=r % players.length; //Yüzde mod alıyor yani kalan
        address payable winner = players[index]; //kazananın index numarası alınıyor
        emit winnerSelected(winner, address(this).balance); //kazanan seçiliyor bilgi gönderiliyor
        winner.transfer(address(this).balance); //para transfer ediliyor
        players = new address payable[](0); //Players adres listesi temizleniyor.
    }
}
