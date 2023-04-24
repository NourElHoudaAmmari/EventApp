class Events {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final String date;
  final String month;
  final String updated;

  Events({this.id="", required this.name, required this.location, required this.imageUrl, required this.date, required this.month, required this.updated });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      date: json['date'] as String,
      month: json['month'] as String,
      updated: json['updated'] as String,
    );
  }

  @override
  String toString() {
    return 'Cases{id: $id, name: $name, age: $location}';
  }
}