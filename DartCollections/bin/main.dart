class Person{
  String name;

  Person(this.name);

}

main(List<String> arguments) {

  var james = new Person("James");
  var bharat = new Person("Bharat");
  var shela = new Person("shela");
  var gloria = new Person("gloria");

  

  var list = [10, 2, 13, 24, 10, 56];
  var onlyStrings = new List<String>();



  var personList = new List<Person>();
  personList.add(james);
  personList.add(bharat);
  personList.add(shela);
  personList.add(gloria);

  for (int i = 0; i < personList.length; i++) {
    print(personList[i].name);
  }

  onlyStrings.add("Paulo");
  onlyStrings.add("Bharat");

  //  print(list.length);
  //  print(list[list.length - 1]);

  for (int i = 0; i < onlyStrings.length; i++) {
    print(onlyStrings[i]);
  }

  for (int i = 0; i < list.length; i++) {
    if (list[i] % 2 == 0)
      print("${list[i]} is multiple of 2");
    else
      print("Index $i containes ${list[i]}");
  }
}
