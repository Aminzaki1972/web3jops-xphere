// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Owner
 * @dev First contract deployed on Xphere Testnet
 * @author Aminzaki1972
 * @notice Contract Address: 0x8E6Af9636141757a54A2c055F5428235DB9E1916
 */
contract Owner {
    address private owner;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }

    function changeOwner(address newOwner) public isOwner() {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}
