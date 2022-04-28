// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;
import "hardhat/console.sol";

contract Events{

    struct Ogrenci{
        string isim;
        bool katilim;
        int imza;
    }

    Ogrenci public yeniOgrenci;

    //Events
    event yeniOgrenciEvent(string isim, bool katilim, int imza);

    function yeniOgrenciKayit(string memory _isim, bool _katilim, int _imza) public{
        yeniOgrenci.isim = _isim;
        yeniOgrenci.katilim = _katilim;
        yeniOgrenci.imza = _imza;
        emit yeniOgrenciEvent(_isim,_katilim,_imza);
    }
}
