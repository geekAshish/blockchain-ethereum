contract SolidityStorage {
  uint256 public favouriteNumber;

  // Mapping
  mapping(string => uint256) public nameToFavoriteNumber;

  struct People {
    string name;
    uint256 favouriteNumber;
  }

  People public person = People({favouriteNumber: 2, name: "Ashish});


  // array
  // dynamic array we don't specify size of the array
  uint256[] public favouriteNumbersList;
  People[] public peoples;

  // fixed size array
  People[4] public peoples;

  function addPerson(string memory _name, uint256 _favouriteNumber) public {
    People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name});
    peoples.push(newPerson);

    or
    People memory newPerson = People(_favouriteNumber, _name);
    peoples.push(newPerson);

    or
    peoples.push(People(_favouriteNumber, _name));


    // Mapping
    nameToFavoriteNumberp[_name] = _favouriteNumber;
  }
}
