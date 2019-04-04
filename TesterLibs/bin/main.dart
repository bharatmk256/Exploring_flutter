import 'package:TesterLibs/TesterLibs.dart' as me;
import 'package:TesterLibs/Utills.dart' as util;

main(List<String> arguments) {
  print('Hello world: ${me.calculate()}!');
  print("Hello: ${me.getName()}");

  var a = 56;
  var b = 10;
  print(util.addNumbers(a, b));

  print(new me.Person("Same").name);
}
