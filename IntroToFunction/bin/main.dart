import 'package:IntroToFunction/IntroToFunction.dart' as IntroToFunction;

main(List<String> arguments) {
  print('Hello world: ${IntroToFunction.calculate()}!');
  doSomething();
}

doSomething() {
  print('hello functions');
  sayMyName();
}

sayMyName() {
  print('hello my name');
  var name = "bharat";
  if (name.contains("b")) {
    print('hey');
  } else {
    print('nay');
  }
}
