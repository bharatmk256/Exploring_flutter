abstract class Animal {
  void breath(); // abstract method

  void makeNoise() {
    print("Making Noises");
  }
}

abstract class IsFunny {
  void makePeopleLaugh(); //abstract method
}

class TVShow implements IsFunny {
  String name;

  @override
  void makePeopleLaugh() {
    print("Tv show is funny");
  }
}

class Comedian extends Person implements IsFunny {
  Comedian(String name, String nationality) : super(name, nationality);

  @override
  void makePeopleLaugh() {
    print("Comedian making people Laugh");
  }
}

class Person implements Animal {
  String name, nationality;

  Person(this.name, this.nationality);

  @override
  void breath() {
    print("Person breating through nose!");
  }

  @override
  void makeNoise() {
    print("Person shouting");
  }

  @override
  String toString() => "$name $nationality";
}

main(List<String> arguments) {
  var jenny = new Person("Jenny", "indian");
  print(jenny);
}
