class EventModel {
  final String? id;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? date;
  final String? month;

  EventModel({
    this.id,
    this.name,
    this.location,
    this.imageUrl,
    this.date,
    this.month,
  });
}

final events = [
  EventModel(
    id: '1',
    name: 'Flutter training ',
    location: 'Marsa, Tunis',
    imageUrl: 'assets/img_event_1.png',
    date: '9',
    month: 'Sept',
  ),
  EventModel(
    id: '2',
    name: 'Hybrid development training',
    location: 'Ben Arous, Tunise',
    imageUrl: 'assets/img_event_2.png',
    date: '12',
    month: 'Sept',
  ),
];