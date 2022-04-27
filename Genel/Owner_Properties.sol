// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract TransferApp{

    address public kontratSahibi;

    constructor() public{
        kontratSahibi = msg.sender;
    }

    modifier sadeceSahibi(){
        require(msg.sender == kontratSahibi);
        _;
    }

    struct Property{
        uint id;
        string name;
        string owner;
        uint value;
        uint area;
    }

    mapping(uint => Property) public properties;

    function addProperty(uint _propertyId, string memory _name, string memory _owner, uint _value, uint _area) public sadeceSahibi{
        properties[_propertyId].name = _name;
        properties[_propertyId].owner = _owner;
        properties[_propertyId].value = _value;
        properties[_propertyId].area = _area;
    }

    function queryPropertyById(uint _propertyid) public view returns (string memory name, string memory owner, uint area, uint value){
        return(properties[_propertyid].name, properties[_propertyid].owner, properties[_propertyid].area, properties[_propertyid].value) ;
    }

    function transferPropertyOwnership(uint _propertyid, string memory _newOwner) public{
        properties[_propertyid].owner= _newOwner;
    }    
}
