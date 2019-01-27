class Location {
  num lat, lng; // instance variable or member fields
  Location(this.lat, this.lng);

  // named construction
  Location.create(this.lat, this.lng);
}

class ElevatedLocation extends Location {
  num elevation;

  ElevatedLocation(num lat, num lng, this.elevation)
      : super.create(lat, lng); // call Location() constructor
}

main(List<String> arguments) {
  var elevated = ElevatedLocation(23.89, -234.89, 90);
  print("location = ${elevated.lat}, ${elevated.lng}, ${elevated.elevation}");
}
