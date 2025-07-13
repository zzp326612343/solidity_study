// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract task2 {

    function reverse(string memory input) public pure returns (string memory) {
        bytes memory b = bytes(input);
        uint len = b.length;
        require(len > 0,"can not reverse empty string");
        bytes1 temp;
        for (uint i =0;i<len/2;i++) {
            temp = b[i];
            b[i] = b[len- 1 -i];
            b[len -  1 - i] =temp;
        }
        return string(b);
    }

}