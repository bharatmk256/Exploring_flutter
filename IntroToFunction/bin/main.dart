var myOutSideVar = "Outside Var";


main(List<String> arguments) {

  myOutSideVar = "Hello there";


  print(myOutSideVar);

insideFunction(){
  var agentName = "Bond";

  myOutSideVar = "James";
  print("From Inside is : $myOutSideVar $agentName");
}
insideFunction();

}




















String sayHello(String name, String lastName, [int age]) =>
    "Hello $name $lastName $age Years old.";



String yourAge(String name, String lastName, [int age]) {
// [int age] now age is optional


  var finalResult = "$name $lastName";

  if (age != null) {
    print("$finalResult is $age");
  }

  return finalResult;


}

//bool isKnow() {
//  // boolean function that returns boolean expression
//  var age = 67;
//  if (age > 4) {
//    return true;
//  } else {
//    return false;
//  }
//}
//
//String showName() {
//  // returns String expression
//  return "Hello From showName!";
//}
//
//String getName() => "James Bond";
//// if we already know what we have to return so we use =>  but if there is only one string so we can use this it not gonna return for many
//
//int showAge() {
//  return 18;
//  // it returns integer number
//}
//
//int getAge() => 18;
//// if we already know what we have to return so we use =>  but if there is only one string so we can use this it not gonna return for many
//
//void doSomething() {
//  print('hello functions');
//  // this is gonna print this line
//  sayMyName();
//}
//
//void sayMyName() {
//  var name = "bharat";
//  print('hello my name is $name');
//  if (name.contains("b")) {
//    print('hey');
//  } else {
//    print('nay');
//  }
//}
