// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe {
  function fund() public payable {
    // want to be able to set a minimum fund amount in USD
    // 1. How do we send ETH to this contract?

    // money math is done in terms of wei so 1 ETH needs to be set as 1e18 value
    require(msg.value > 1e18, "Error message") // 1e18 == 1 * 10 ** 18
  }

  function getPrice() public {
    AggregatorV3Interface priceFeed = AggregatorV3Interface();
    (uint80 roundId, int256 price, uint startedAt, uint timeStamp, uint80 answeredInRound) = priceFeed.latestRoundDate();

    // ETH in terms of USD : price * 1e10
    // type conversion type(other_type)
    
    return uint256(price * 1e10) // 10 ** 10
  }

  function getVersion() public view returns {
    AggregatorV3Interface priceFeed = AggregatorV3Interface();
    return priceFeed.version();
  }

  function getConversionRate() {}

  function withdraw() {}
}
