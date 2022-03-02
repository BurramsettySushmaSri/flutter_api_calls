class Users {
  int? id;
  String name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Users(
      {this.id,required this.name,this.username,this.email,this.address,this.phone,this.website,this.company});
  factory Users.parseResponse(dynamic data) {
    return Users(
      id: int.parse(data['id'].toString()),
      name: data['name'],
      username: data['username'],
      email: data['email'],
      address: Address.parseResponse(data['address']),
      phone: data['phone'],
      website: data['website'],
      company: Company.parseResponse(data['company']),
    );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});
  factory Address.parseResponse(dynamic data) {
    return Address(
      street: data['street'],
      suite: data['suite'],
      city: data['city'],
      zipcode: data['zipcode'],
      geo: Geo.parseJson(data['geo']) 
    );
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.parseJson(dynamic data) {
    return Geo(
      lat: data['lat'],
      lng: data['lng'],
    );
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});
  factory Company.parseResponse(dynamic data) {
    return Company(
      name: data['name'],
      catchPhrase: data['catchPhrase'],
      bs: data['bs'],
    );
  }
}
