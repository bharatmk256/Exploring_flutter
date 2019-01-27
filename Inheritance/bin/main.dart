class Person {
  String name, lastName, nationality;
  int age;

  void showName() {
    print(this.name); // method
  }

  void sayHello() {
    print("Hello");
  }

  void showNationality() {
    print("American");
  }
}

class Bonni extends Person {
  String profession;

  void showProfession() => print(profession); // method

  @override
  void showNationality() {
    // TODO: implement showNationality
    print("korian/American");
  }
}

class Paulo extends Person {
  bool playGuitar;

  void showAge() => print(age);

  @override
  void sayHello() {
    // TODO: implement sayHello
    print("ola");
  }

  @override
  void showNationality() {
    // TODO: implement showNationality
    print("Mozambican");
  }
}

main(List<String> arguments) {
  var bonni = new Bonni();
  bonni.name = "Bonni";
  bonni.profession = "programmer";
  bonni.sayHello();
  bonni.showProfession();
  bonni.showName();
  bonni.showNationality();

  var paulo = new Paulo();
  paulo.name = "paulo";
  paulo.age = 18;
  paulo.playGuitar = true;
  paulo.showName();
  paulo.showAge();
  paulo.sayHello();
  paulo.showNationality();
}
