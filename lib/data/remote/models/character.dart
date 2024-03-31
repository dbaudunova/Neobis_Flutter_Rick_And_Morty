class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final Origin? origin;
  final Location? location;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    this.origin,
    this.location,
    required this.image,
  });
}

class Location {
  final String name;
  final String? url;

  Location({
    required this.name,
    this.url,
  });
}

class Origin {
  final String name;
  final String? url;

  Origin({
    required this.name,
    this.url,
  });
}
