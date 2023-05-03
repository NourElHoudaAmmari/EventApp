import 'package:flutter/material.dart';
import 'package:frontend/models/Events.dart';
import 'package:frontend/shared/theme.dart';
import 'detailwidget.dart';

class EventsList extends StatelessWidget {
  final List<Events> events;
  const EventsList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
      //  padding: EdgeInsets.all(8),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //Number of columns
                      childAspectRatio: 0.9, //Ratio of height to width of each grid item
                    ),
               itemCount: events == null ? 0 : events.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: GestureDetector(
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailWidget(events: events[index],)),
                      );
                    },
                    child :  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Expanded(
        child:  Image(
 image: AssetImage('assets/img_event_1.png'),
        fit: BoxFit.cover,
        height: 30,
      ),
      ),
        Divider(thickness: 1,),
                  Container(
                      padding: const EdgeInsets.all(4.0),
                      child:Text(events[index].name??"",
                  //    leading: const Icon(Icons.person),
        
                          style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black
                                ),
                    ),
                    
                  ),
                  SizedBox(height: 6,),
                
                            Column(
                              children: [
Row(
  children: [
    SizedBox(width: 8,),
    Expanded(
      
      child: Text(
        events[index].description??"",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Colors.grey.shade800,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    Icon(Icons.calendar_today, color: Colors.deepOrange),
  ],
),
    SizedBox(height: 8,),                        
                       Row(
  children: [
    Icon(Icons.place_outlined, color: Colors.grey.shade600,),
    SizedBox(width: 5), // Espacement entre l'icône et le texte
    Text(
      events[index].location??"",
        maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade500,
        fontStyle: FontStyle.italic,
      ),
    ),
  ],
),
                              ],
                            ),
    ],
                    ),
                  ),
              );
          }
          );
  }
  
}