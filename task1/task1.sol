// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    constructor() {
        owner = msg.sender;
    }
    event ticket(address from,address to);
    mapping(address => uint) public ticketMap;
    address private immutable owner;
    address[] public addrs; 

    function vote(address addr) public {
        if (ticketMap[addr] == 0) {
            addrs.push(addr);
        }
        ticketMap[addr] ++;
        emit ticket(msg.sender, addr);
    }

    function getVotes(address addr) public view returns (uint) {
        return ticketMap[addr];
    }

    function resetVotes() external {
        require(msg.sender == owner,"can not delete");
        uint len = addrs.length;
        for (uint i =0; i< len;i ++) {
            delete ticketMap[addrs[i]];
        }
        delete addrs;
    }
}
