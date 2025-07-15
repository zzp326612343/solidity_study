// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BeggingContract {
    address[] private addrs;
    mapping(address => uint256) private balanceOf;
    address private _owner;

    modifier onlyOwner() {
        require(msg.sender == owner(), "You are not the owner.");
        _;
    }
    

    event BalanceSet(address indexed sender,uint256 amount);
 
    constructor() {
        _owner=msg.sender;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    receive() external payable { 
        require(msg.value > 0, "Donation must be > 0");
        uint256 balance = msg.value;
        balanceOf[msg.sender] += balance;
        addrs.push(msg.sender);
        emit BalanceSet(msg.sender,balance);
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be > 0");
        balanceOf[msg.sender] += msg.value;
        addrs.push(msg.sender);
        emit BalanceSet(msg.sender, msg.value);
    }

    function withdraw() public onlyOwner  {
        uint256 amount = address(this).balance;
        require(amount > 0, "You don't have enough tokens.");
        payable(_owner).transfer(amount);
    }

    function getDonation(address add) public view returns (uint256) {
        return balanceOf[add];
    }
}