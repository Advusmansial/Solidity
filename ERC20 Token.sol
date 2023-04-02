 // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract MyCoinERC20 {
    // Transfer event must be triggered when tokens are transferred.
    event Transfer(address indexed from, address indexed to, uint tokens);
    // Approval event must be triggered when spender is approved to collect tokens from owner.
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    // Set the name of our token, its symbol, and the decimal to use.
    string public constant name = "My Coin";
    string public constant symbol = "MC";
    uint8 public constant decimals = 16;
    // We will declare two mappings.
 mapping(address => uint256) balances; // First for holding the token balance of each owner account.

    mapping(address => mapping (address => uint256)) allowed;
    mapping(address => mapping (address => uint256)) allowed; // Second for 

    uint256 totalSupply_;

    constructor(uint256 total) {
    constructor (uint256 total) {
      totalSupply_ = total;
      balances[msg.sender] = totalSupply_;
    }
@@ -36,15 +36,16 @@ contract MyCoinERC20 {
        return balances[tokenOwner];
    }

 function transfer(address receiver, uint numOfTokens) public returns (bool) {
 function transfer(address receiver, uint numOfTokens) public payable returns (bool) {
        require(numOfTokens <= balances[msg.sender]);

        balances[msg.sender] -= numOfTokens;
        balances[receiver] += numOfTokens;
        emit Transfer(msg.sender, receiver, numOfTokens);
        return true;
    }

    function approve(address delegate, uint numOfTokens) public returns (bool) {
    function approve(address delegate, uint numOfTokens) public payable returns (bool) {
        allowed[msg.sender][delegate] = numOfTokens;
        emit Approval(msg.sender, delegate, numOfTokens);
        return true;
@@ -54,14 +55,14 @@ contract MyCoinERC20 {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
    function transferFrom(address owner, address buyer, uint numOfTokens) public payable returns (bool) {
        require(numOfTokens <= balances[owner]);
        require(numOfTokens <= allowed[owner][msg.sender]);

        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        balances[owner] -= numOfTokens;
        allowed[owner][msg.sender] -= numOfTokens;
        balances[buyer] += numOfTokens;
        emit Transfer(owner, buyer, numOfTokens);
        return true;
    }
}
