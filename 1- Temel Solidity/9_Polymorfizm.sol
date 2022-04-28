// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;
import "hardhat/console.sol";

contract Poly{

    function topla(int a, int b) public pure returns(int){
        return a+b;
    }

    function topla(int a, int b, int c) public pure returns(int){
        return a+b+a;
    }

    function topla(string memory a, string memory b) public pure returns(string memory, string memory){
        return(a,b);
    }    
}
