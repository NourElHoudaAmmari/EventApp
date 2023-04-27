class Events {
  final String id;
  final String name;
  final String description;
  final String location;
  final String imageUrl;
  final String date;
  final String duree;
  final String nbplace;
  final String updated;

  Events({this.id="", required this.name,required this.description, required this.location, required this.nbplace, required this.imageUrl, required this.date, required this.duree, required this.updated });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      date: json['date'] as String,
      duree: json['duree'] as String,
       nbplace: json['nbplace'] as String,
      updated: json['updated'] as String,
    );
  }

  @override
  String toString() {
    return 'Cases{id: $id, name: $name, age: $location}';
  }
}