// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract myGame {
    uint public playerCount = 0;
    uint public pot = 0;
    
    address public dealer;
    
    Player[] public playersInGame;
    
    mapping(address => Player) public players;
    
    enum Level {Novice, Intermediate, Advanced }
    
    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }
    
    constructor(){
        dealer = msg.sender;
    }
    
    function addPlayer(string memory firstNane, string memory lastName) private  {
        Player memory newPlayer =  Player(msg.sender, Level.Novice, firstNane, lastName, block.timestamp);
        players[msg.sender] = newPlayer;
        playersInGame.push(newPlayer);
        
    }
    
    function getPlayerLevel(address playerAddress) public view returns (Level){
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }
    
    function changePlayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if(block.timestamp >= player.createdTime + 20){
            player.playerLevel = Level.Intermediate;
        }
    }
    
    function joinGame(string memory firstNane, string memory lastName) payable public {
        require(msg.value == 25 ether, "The joining fee is 25 ether");
        // If the dealer can receive some amount of of ether from who ever is trying to join the game;
        // Send money to the dealer directly
        if(payable(dealer).send(msg.value)){
            addPlayer(firstNane, lastName);
            playerCount += 1;
            pot += 25;
        }
    }
    
// ERROR in this function.
    function payOutWinner(address loserAddress) payable public{
        require(msg.sender == dealer, "Only the dealer can pay out the winner");
        // trying to convert pot to same unit to compare
        require(msg.value == pot * (1 ether));
        uint payoutPerWiner = msg.value / (playerCount -1);
        for(uint i= 0; i < playersInGame.length; i++){
            address currentPlayerAddress = playersInGame[i].playerAddress;
            if(currentPlayerAddress != loserAddress){
                payable(currentPlayerAddress).transfer(payoutPerWiner);
            }
        }
    }
}
