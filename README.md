## About the project
This project is for the final project of ETHBeginner course of Metacrafters. The project's basic requirement is about making our own Token.

## Detailed/Technical Description
In the project there are three variables
```solidity
    //Token Name
    string public TokenName;
    // Token Abbrv.
    string public TokenSymbol;
    // Total Supply
    uint256 public totalTokenSupply;
```
There is a mapping for balances
```solidity
    // mapping connecting user address to balance
    mapping (address => uint256) public balances;
```
There is a constructor. Name of the token is given 'BESTTOKEN' and its symbol/Abbrve. is 'BT'
```solidity
    constructor() {
        TokenName = "BESTTOKEN";
        TokenSymbol = "BT";
        totalTokenSupply = 0;
    }
```
Then in the last there are two functions mint and burn who have appropriate checks/reverts. These functions are used to mint new tokens or burn the existing tokens. Minting and Burning directly effects the totalTokenSupply.
```solidity
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
```

## THANKS!!!
