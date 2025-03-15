// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// import library
import './PriceConvertor';

contract fundMe {
  using PriceConvertor for uint256;

  uint256 public minimumUsd = 50 * 1e18;
  address[] public funders;
  mapping(address => uint256) public addressToAmountFunded;

  function fund() public payable {
    // want to be able to set a minimum fund amount in USD
    // 1. How do we send ETH to this contract?

    // money math is done in terms of wei so 1 ETH needs to be set as 1e18 value
    // require(getConversionRate(msg.value) >= minimumUsd, "Error message") // 1e18 == 1 * 10 ** 18

    // using library
    require(msg.value.getConversionRate() >= minimumUsd, "Error message") // 1e18 == 1 * 10 ** 18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
  }

  function withdraw() public {
    for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
      address funder = funders[funderIndex]
      addressToAmountFunded[funder] = 0;
    }
    // reset the array
    funders = new address[](0);

    // actually withdraw the funds

    // transfer
    // msg.sender type is address
    // payable(msg.sender) type is payable
    payable(msg.sender).transfer(address(this).balance);


    // send
    bool sendSuccess = payable(msg.sender).send(address(this).balance);
    require(sendSuccess, "send failed");

    // call
    (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "call failed");


  }
}
