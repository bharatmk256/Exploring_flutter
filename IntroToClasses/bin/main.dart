class Microphone {
  // Instance variable, member variable
  // this = this object/class

  String name;
  String color;
  int model = 456;


//  //constructor
//  Microphone(String name, String color, int model) {
//    this.name = name;
//    this.color = color;
//    this.model = model;
//  }


  // synthetic sugar constructor
  Microphone(this.name, this.color, this.model); // methods

  //named constructor
  Microphone.initialize(){
    name = "Blue Yeti Second edition";
    model = 67;

  }

  String get getName => name; // getter
  set setName (String value) => name = value; // setter





  void turnOn() {
    print("$name is on!");
  }

  bool isOn() => true;

  int modelNumber() => model;

  void turnOff() {
    print("$name is truned of!");
  }

  void setVolume() {
    print("$name with color : $color volume is up!");
  }
}











main(List<String> arguments) {
  var mic = new Microphone("Blue Yeti", "Silver Grary", 1234); //we are creating the actual object

  mic.setName = "new name";

  print(mic.getName);














//  var micSecond = new Microphone.initialize();  //using initialize named constructor
//  print(micSecond.model);
//  print(micSecond.name);
//
//  print(mic.name); // . (dot) is access operator
//  print(mic.model); // . (dot) is access operator
//
//  mic.turnOn();
//  mic.setVolume();
//  mic.turnOff();
//  print(mic.isOn());
//  print(mic.modelNumber());
}
