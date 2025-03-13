// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import './SimpleStorage.sol';

contract FactoryStorage {
  SimpleStorage[] public simpleStorageArr;

  function createSimpleStorageCreate() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArr.push(simpleStorage);
  }

  function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    // to interact with any contract, we always need two things
    // 1. Contract Address
    // 2. ABI - Application Binary Interface

    SimpleStorage simpleStorage = simpleStorageArr[_simpleStorageIndex];
    simpleStorage.store(_simpleStorageNumber);
  }

  function sfGet(uint _simpleStorageIndex) public view returns(uint256) {
    return simpleStorageArr[_simpleStorageIndex].retrieve();
  }
}



