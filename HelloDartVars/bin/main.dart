// entry point main function
main(List<String> arguments) {
  var country = 'india'; // variable declaration
  var country_1 = 1.1; // variable declaration
  String name = 'bharat';
  String lastName = 'makwana';
  /*var is equal too
  * int
  * float
  * double
  * String
  * booleans
  * lists
  * maps
  * ...
  * */

  int age = 18;
  num ages = 2.3;
  num aggges = 23;
  /*num is all type of number */

  var sum = age + aggges; // arithmatic operations

  bool isTrue = true;
  bool isFalse = false;
  /*boolean in dart*/

  final pi = 3.14;
  const pies = 34.1;
  /*const = we use this keyword when we want the value/variable to be constant at compile-time
  * final = if we want to variable/value to always be constant = never changes 
  * */

  print(name); // hi there hello world print
  print(country); // print variable
  print(country_1); // print variable
  print(age);
  print(ages);
  print(
      "$name $lastName is $age year old"); // if we use this $ sign in string it and pass variable it will print variable
  print(
      "hello there $name ${lastName.toUpperCase()} ??"); // so as we seen that we have put our variable in curly brace and used to uppercase to make text upper case
  print(sum);
}
