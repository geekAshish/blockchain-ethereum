contract SolidityStorage {
  uint256 public favouriteNumber;

  funtion store(uint _favouriteNumber) public {
    favouriteNumber = _favouriteNumber;
  }

  // view, pure
  funtion retrive() public view returns(uint256) {
    return favouriteNumber;
  }
}
