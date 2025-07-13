// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract task2 {
    mapping(bytes1 => int256) public symbolValues;

    constructor() {
        symbolValues['I'] = 1;
        symbolValues['V'] = 5;
        symbolValues['X'] = 10;
        symbolValues['L'] = 50;
        symbolValues['C'] = 100;
        symbolValues['D'] = 500;
        symbolValues['M'] = 1000;
    }

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

    function toNumber(string memory input) public view returns (int256 ans) {
        bytes memory b = bytes(input);
        uint256 n = b.length;
        require(n > 0, "Empty string not allowed");
        for (uint256 i = 0; i < n; i++) {
            int256 value = symbolValues[b[i]];
            int256 nextValue = 0;
            if (i < n - 1) {
                nextValue = symbolValues[b[i + 1]];
            }

            if (value < nextValue) {
                ans -= value;
            } else {
                ans += value;
            }
            
        }
        return ans;
    }

    uint16[] private values = [
        1000, 900, 500, 400,
        100, 90, 50, 40,
        10, 9, 5, 4,
        1
    ];

    string[] private numerals = [
        "M", "CM", "D", "CD",
        "C", "XC", "L", "XL",
        "X", "IX", "V", "IV",
        "I"
    ];

    function toRoman(uint num) public view returns (string memory res) {
        require(num > 0 && num < 4000, "Invalid input");

        bytes memory result;
        for (uint i = 0;i<values.length;i++) {
            while(num >= values[i]) {
                result = abi.encodePacked(result, numerals[i]);
                num -= values[i];
            }
        }
        return string(result);
    }

    function mergeSortedArrays(uint[] memory a, uint[] memory b) public pure returns (uint[] memory) {
        uint i = 0;      // 指针 i 用来遍历数组 a
        uint j = 0;      // 指针 j 用来遍历数组 b
        uint k = 0;      // 指针 k 用来给 result[] 填值
        uint totalLength = a.length + b.length; // 结果数组的总长度
        uint[] memory result = new uint[](totalLength); // 创建一个新的数组 result，用来存储合并结果

        // 👇 开始比较两个数组的值
        while (i < a.length && j < b.length) {
            if (a[i] <= b[j]) {
                result[k++] = a[i++]; // a[i] 比较小，把它放进结果数组，然后 i++
            } else {
                result[k++] = b[j++]; // b[j] 比较小，把它放进结果数组，然后 j++
            }
        }

        // 👇 如果 a 还有剩余，就把 a 剩下的都放进 result
        while (i < a.length) {
            result[k++] = a[i++];
        }

        // 👇 如果 b 还有剩余，就把 b 剩下的都放进 result
        while (j < b.length) {
            result[k++] = b[j++];
        }

        return result;
    }

    function searchNum(int[] memory nums,int num) public pure returns (int ans) {
        require(nums.length >0,"Array length should be greater than 1.");
        int left = 0;
        int right = int(nums.length) - 1;
        while(left<=right) {
            int mid = (left + right) /2;
            int midVal = nums[uint(mid)];
            if (midVal == num) {
                return mid;
            } else if(midVal >num ) {
                right = mid -1;
            } else {
                left = mid +1;
            }
        }
        return -1;
    }

}