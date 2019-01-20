// entry point main function
main(List<String> arguments) {
//  var country = 'india'; // variable declaration
//  var country_1 = 1.1; // variable declaration
//  String name = 'bharat';
//  String lastName = 'makwana';
//  /*var is equal too
//  * int
//  * float
//  * double
//  * String
//  * booleans
//  * lists
//  * maps
//  * ...
//  * */
//
//  int age = 18;
//  num ages = 2.3;
//  num aggges = 23;
//  /*num is all type of number */
//
//  var sum = age +
//      aggges; // arithmetic operations these are the arithmetic operators that we can use (+ - / * %)
//
//  bool isTrue = true;
//  bool isFalse = false;
//  /*boolean in dart*/
//
//  final pi = 3.14;
//  const pies = 34.1;
//  /*const = we use this keyword when we want the value/variable to be constant at compile-time
//  * final = if we want to variable/value to always be constant = never changes
//  * */
//
//  if (age == ages) {
//    print('if true it will print');
//  } else {
//    print('else it will run');
//  }
//  /*conditional statement*/
//
//  /*logical operators
//  * (!, ||, &&)*/
//
//  print(pi <= pies);
//  /*equality and relational operators
//  * (==, !=, >, <, >=, <=)*/
//
//  print(pi is int); /*is is conditional statement return true and false*/
//
//  print(name); // hi there hello world print
//  print(country); // print variable
//  print(country_1); // print variable
//  print(age);
//  print(ages);
//  print(
//      "$name $lastName is $age year old"); // if we use this $ sign in string it and pass variable it will print variable
//  print(
//      "hello there $name ${lastName.toUpperCase()} ??"); // so as we seen that we have put our variable in curly brace and used to uppercase to make text upper case
//  print(sum);

//  int number = 34;
//  int numberTwo = 2;
//
//  double pi = 3.14;
//  double gravity = 9.8;

//  if (!(number != 100) || number <= 100) {
//    // conditional statement and logical operator
//    // || or means only one side to be true for making this statement true
//    print("Not a hundred");
//  } else {
//    print("Yes");
//  }
//
//  if (!(number != 100) && number <= 100) {
//    // conditional statement and logical operator
//    // && and means both side to be true for making this statement true
//    print("Not a hundred");
//  } else {
//    print("Yes");
//  }
//
//  int number = 34;
//  int numberTwo = 2;
//
//  double pi = 3.14;
//  double gravity = 9.8;
//
//  var fruit = 'mango';

//  for (var i = 0; i < 10; i++) {
//    if (i % 3 == 0) {
//      print("$fruit $i");
//    }
//  }

//  do {
//    print("Hello world"); // run loop
//  } while (number < 30); // then checks condition

//  while (true) {
//    if (number >= 32) print("Going...");
//    break; // break loop  we can use it in any loop
//  }

  var age = 18;

  switch (age) {
    case 19:
      print('okay you can buy ciggarets');
      break;
    case 20:
      print('take it');
      break;
    case 89:
      print('too old');
      break;
    default:
      print('okay your age is $age');
      break;
  }
}
