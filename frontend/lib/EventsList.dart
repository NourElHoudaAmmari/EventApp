import 'package:flutter/material.dart';
import 'package:frontend/models/Events.dart';
import 'detailwidget.dart';

class EventsList extends StatelessWidget {
  final List<Events> events;
  const EventsList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailWidget(events: events[index],)),
                      );
                    },
                    child: ListTile(
                  //    leading: const Icon(Icons.person),
                      title: Text(events[index].name),
                      subtitle: Text(events[index].location),
                    ),
                  )
              );
          });
  }
}