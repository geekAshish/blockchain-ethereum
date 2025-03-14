// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract fundMe {
  function fund() public payable {
    // want to be able to set a minimum fund amount in USD
    // 1. How do we send ETH to this contract?

    // money math is done in terms of wei so 1 ETH needs to be set as 1e18 value
    require(msg.value > 1e18, "Error message") // 1e18 == 1 * 10 ** 18
  }

  function withdraw() {}
}
