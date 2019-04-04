

main(List<String> arguments) {

//  it's an map
  var winners = {
    // key : value;
    "first" : "Bill",
    "second" : "George",
    "third" : "Bond"
  };

  var winnerSecond = {
    1 : "Apolo",
    2 : "Something",
    3 : "Another"
  };

  var winnerThird = {
    "Winter" : 3,
    "Autum" : 1,
    "Spring" : 3
  };

  print(winners["second"]);

  winners.forEach((k,v) => print(k));

  var keys = winners.keys;
  var values = winners.values;
  print(keys);
  print(values);

}
