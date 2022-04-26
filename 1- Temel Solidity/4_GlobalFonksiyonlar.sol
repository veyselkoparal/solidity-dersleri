// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.7.0 < 0.9.0;

contract GlobalFonksiyonlar{

    //Gönderilen balance değeri
    uint public msgValue;

    function getValues() public view returns(uint blockNumber,uint timeStamp, uint gasLimit, address msgSender, bytes calldata msgData){
        return (block.number, block.timestamp, block.gaslimit, msg.sender, msg.data);
    }

    function payContract() payable public{
        //msg.value = mesajla birlikte gönderilen wei sayısı
        msgValue = msg.value;
    }

}

/*
Stringlerde Escape Karakterler
\n — Yeni Satır
\\ — Backslash
\’ — String içinde tırnak kullanılmak istenirse
\” — String içinde çift tırnak kullanılmak istenirse
\t — tab
*/

/*
blockhash(uint blockNumber) returns (bytes32)	Verilen bloğun hash'i - mevcut bloklar hariç, yalnızca en son 256 için çalışır
block.coinbase (address payable)	Mevcut blok madencisinin adresi
block.difficulty (uint)	Mevcut blok zorluğu
block.gaslimit (uint)	Mevcut blok gaslimit
block.number (uint)	Mevcut block numarası
block.timestamp (uint)	Unix çağından bu yana saniye olarak geçerli blok zaman damgası
gasleft() returns (uint256)	Kalan gas
msg.data (bytes calldata)	Arama verilerini tamamla
msg.sender (address payable)	Mesajı gönderen (mevcut arayan)
msg.sig (bytes4)	calldata nın ilk dört baytı (fonksiyon tanımlayıcı)
msg.value (uint)	Mesajla birlikte gönderilen wei sayısı
now (uint)	Mevcut block timestamp
tx.gasprice (uint)	İşlemin gaz fiyatı
tx.origin (address payable)	İşlemi gönderen
*/
