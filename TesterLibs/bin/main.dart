import 'package:TesterLibs/TesterLibs.dart' as me;
import 'package:TesterLibs/Utills.dart' as util;
import 'dart:math' as math;

main(List<String> arguments) {
  print('Hello world: ${me.calculate()}!');
  print("Hello: ${me.getName()}");

  var a = 56;
  var b = 10;
  print(util.addNumbers(a, b));

  print("Max is ${math.max(10, 123)}");
  print(math.sqrt(10));

  print(new me.Person("Same").name);
}
