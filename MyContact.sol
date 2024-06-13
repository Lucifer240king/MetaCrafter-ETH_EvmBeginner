
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    /*

    Token Name = name
    Token Abbrv = Job
    Total Supply = Salary
    
    */

    string public name;
    string public Job;
    uint public Salary;

    mapping(address => uint) public balances;

    constructor(string memory _name, string memory _Job, uint _Salary) {
        name = _name;
        Job = _Job;
        Salary = _Salary;
        balances[msg.sender] = _Salary;
    }

    function mint(address _to, uint _value) public {
        Salary += _value;
        balances[_to] += _value;
        
    }

    function burn(address _from, uint _value) public {
        if(balances[_from]>=_value){
            Salary -= _value;
            balances[_from] -= _value;
        }else{
            revert("Insufficient balance");
        }
    }
}
