// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConvertor {
  function getPrice() internal view returns (uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface();
    (uint80 roundId, int256 price, uint startedAt, uint timeStamp, uint80 answeredInRound) = priceFeed.latestRoundDate();

    // ETH in terms of USD : price * 1e10
    // type conversion type(other_type)
    
    return uint256(price * 1e10); // 10 ** 10
  }

  function getVersion() internal view returns (uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface();
    return priceFeed.version();
  }

  function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

    return ethAmountInUsd;
  }
}