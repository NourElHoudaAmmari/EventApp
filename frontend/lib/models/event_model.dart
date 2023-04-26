import 'package:frontend/models/user_model.dart';

class EventModel {
  final String? id;
  final String? name;
    final String? description;
  final String? location;
  final String? imageUrl;
  final String? date;
  final String? month;
   //final User user;

  EventModel({
    this.id,
   
    this.description,
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
    name: 'Flutter Cross pmlateform training ',
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