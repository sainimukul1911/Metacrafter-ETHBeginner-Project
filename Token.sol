// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Token {
    //Token Name
    string public TokenName;
    // Token Abbrv.
    string public TokenSymbol;
    // Total Supply
    uint256 public totalTokenSupply;

    // mapping connecting user address to balance
    mapping (address => uint256) public balances;

    constructor() {
        TokenName = "BESTTOKEN";
        TokenSymbol = "BT";
        totalTokenSupply = 0;
    } 

    function mint(address user , uint256 value) public {
        if(value <= type(uint256).max){           // basic check for value
        totalTokenSupply += value;                // increasing totalSupply by value
        balances[user] += value;                  // increases balance by value
        }              
    }

    function burn(address user , uint256 value) public {
        if(balances[user] < value){           // checking if user trying to burn more than balance
            revert("Can't burn more than current balance");
        }
        totalTokenSupply -= value;            // decreasing totalSupply by value
        balances[user] -= value;              // decreasing balance by value
    }
}
