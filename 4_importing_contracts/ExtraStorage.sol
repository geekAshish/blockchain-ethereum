// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;


import './SimpleStorage';

// Inheritance
contract ExtraStorage is SimpleStorage {
  // Overriding
  // Override, virtual

  funtion store(uint _favouriteNumber) public override {
    favouriteNumber = _favouriteNumber + 5;
  }
}