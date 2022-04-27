// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract bankaUygulamasi{

    mapping(address => uint) public hesapListesi;

    modifier hesapBakiyeKontrol(uint _miktar) {
        require(_miktar <= hesapListesi[msg.sender], "Dusuk Bakiye");
        _;
    }

    function depositEkle() public payable {
        hesapListesi[msg.sender] += msg.value;
    }

    function cekimYap(uint _miktar) public hesapBakiyeKontrol(_miktar){
        payable(msg.sender).transfer(_miktar);
    }

    function bankaBakiyeKontrol() public view returns(uint){
        return address(this).balance;
    }
}
