// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe {
  uint256 public minimumUsd = 50 * 1e18;
  address[] public funders;
  mapping(address => uint256) public addressToAmountFunded;

  function fund() public payable {
    // want to be able to set a minimum fund amount in USD
    // 1. How do we send ETH to this contract?

    // money math is done in terms of wei so 1 ETH needs to be set as 1e18 value
    require(getConversionRate(msg.value) >= minimumUsd, "Error message") // 1e18 == 1 * 10 ** 18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
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

  function getConversionRate(uint256 ethAmount) public view returns (uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

    return ethAmountInUsd;
  }

  function withdraw() {}
}
