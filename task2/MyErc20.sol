// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

abstract contract MyErc20 is IERC20 {
    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address account) public virtual view returns (uint256) {
        return _balances[account];
    }

    function totalSupply() public virtual view returns (uint256) {
        return _totalSupply;
    }

    function name() public virtual view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function transfer(address recipientl,uint256 value) public virtual returns (bool) {
        address owner = msg.sender;
        _balances[owner] -=value;
        _balances[recipientl] +=value;
        emit Transfer(owner,recipientl,value);
        return true;
    }

    function allowance(address owner, address spender) public virtual view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spenderl, uint256 value) public virtual returns (bool) {
        _allowances[msg.sender][spenderl] = value;
        return true;
    }
    
    function transferFrom( address owner_,address recipient_ , uint256 value) public virtual returns (bool) {
        _allowances[owner_][msg.sender] -=value;
        _balances[recipient_] +=value;
        transfer(recipient_, value);
        return true;
    }
}