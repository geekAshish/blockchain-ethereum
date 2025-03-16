// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// import library
import './PriceConvertor';

error NotOwner();

contract fundMe {
  using PriceConvertor for uint256;

  uint256 public constant MINIMUM_USD = 50 * 1e18;
  address[] public funders;
  mapping(address => uint256) public addressToAmountFunded;

  address public immutable i_owner;

  constructor() {
    i_owner = msg.sender;// whom ever deploy the contract
  }

  function fund() public payable {
    // want to be able to set a minimum fund amount in USD
    // 1. How do we send ETH to this contract?

    // money math is done in terms of wei so 1 ETH needs to be set as 1e18 value
    // require(getConversionRate(msg.value) >= MINIMUM_USD, "Error message") // 1e18 == 1 * 10 ** 18

    // using library
    require(msg.value.getConversionRate() >= MINIMUM_USD, "Error message"); // 1e18 == 1 * 10 ** 18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
  }

  function withdraw() public onlyOwner {
    for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
      address funder = funders[funderIndex];
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

  modifier onlyOwner {
    // require(msg.sender == i_owner, "Sender is not owner");
    if(msg.sender != i_owner) { revert NotOwner(); } 
    _;
  }

  // What happens if someone sends this contract ETH without calling the fund function.
  receive() external payable {
    fund();
  }

  fallback() external payable {
    fund();
  }
}
