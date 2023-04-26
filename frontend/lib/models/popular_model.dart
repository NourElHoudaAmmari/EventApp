import 'package:frontend/models/user_model.dart';

class PopularModel {
  final int? id;
 
  final String? name;
  final String? imageUrl;
  final String? isTicket;
  final String? date;
  final String? time;

  PopularModel({
    this.id,
   
    this.name,
    this.imageUrl,
    this.isTicket,
    this.date,
    this.time,
  });
}

final populars = {
  PopularModel(
    id: 1,
    name: 'Free Code Camp',
    date: '9 August 2023',
    time: '10:00 AM',
    isTicket: 'registration',
    imageUrl: 'assets/img_event_3.png',
  ),
  PopularModel(
    id: 1,
    name: 'Android Hackthon',
    date: '12 September 2023',
    time: '8:00 AM',
    isTicket: 'registration',
    imageUrl: 'assets/img_event_4.png',
  ),
};