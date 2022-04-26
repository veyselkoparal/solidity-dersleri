// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

contract Degisken{

    //tamsayılar int8 => 2^8 -128 <> 127 || uint8 => 2^8 0 <> 255
    int8 public deger=127;
    uint8 public deger2=255;
    uint256 public buyukdeger;

    bool public tf;

    string public isim="veysel";
    //HexaDecimal
    bytes public bytedeger = "ABC";

    //array
    string[] public names = ["Ahmet", "Mahmut", "Caner"];
    string[4] public name2 = ["Melike", "Ceren", "Kehribar"];

    //mapping -> dictionary key->values
    mapping (int => bool) public maaslar;

    //enums
    enum cities{Ankara, Istanbul, Bursa}
    cities public c1 = cities.Istanbul;

    //struct
    struct Ogrenci {
        string name;
        string surname;
        uint8 numara;
    }

    Ogrenci public ogr1 = Ogrenci("Zulal","Karabag",25);
    Ogrenci public ogr2 = Ogrenci("Ahmet","Balli",33);

}