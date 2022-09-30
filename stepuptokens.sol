// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StepUpToken {

    address owner;
    uint totalNumofToken;
    string name = "StepUpToken";
    string symbol = "SU";
    
    mapping(address=>uint) balances;

    constructor(uint _total) {
        totalNumofToken = _total;
        balances[msg.sender] = _total;
    }

    function getBalance(address someone) public view returns (uint) {
        return balances[someone];
    }

    function transfer(address receiver, uint tokens) public {
        require(balances[msg.sender] >= tokens,"Not enough tokens");
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[receiver] = balances[receiver] + tokens;

    }

    function _burn(uint256 tokens) public {
        require(owner == address(0x0));
        balances[msg.sender] = balances[msg.sender]-tokens;
        totalNumofToken = totalNumofToken - tokens;
    }
    //burn -> 0x00 / 
    //update-> totalNumofToken

}
