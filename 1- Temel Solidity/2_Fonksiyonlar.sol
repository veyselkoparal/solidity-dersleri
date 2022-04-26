// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

contract Fonksiyonlar{

    uint8 public a=10;
    uint8 public b=3;
    string public isim="Selim";

    function goster() public view returns(uint8 _a, uint8 _b){
        return (a, b);
    }

    function veriCek() public returns(uint){
        a+=1;
        return a;
    }

    //Sadece veri ekrana yazdırmak için pura komutu
    function veriOku() public pure returns(int16 balance, bool live){
        return(22, true);
    }

    //Veriyi set etmek için input alanı açar 
    function setIsim(string memory _isim) public{
        isim=_isim;
    }

}