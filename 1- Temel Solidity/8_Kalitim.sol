// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;
import "hardhat/console.sol";

contract Country{
    string public ulkeadi;
    string public bayrak;
    string private dil;

    int public a;
    constructor(int _a){
        a=_a;
    }
}

//Country kontratını kalıtım olarak almak için "Turkey is Country" yazmanız lazım

contract Turkey is Country(4){
    uint public kilometre;
    string public yuzolcumu;
}

contract Germany is Country, Turkey{
    uint public nufus;
    string public basbakan;
}
