

import 'package:flutter/material.dart';
import 'package:frontend/models/event_model.dart';

class EventDetailsScreen extends StatefulWidget {
   final EventModel event;
  const EventDetailsScreen(
    this.event, {
    Key? key,
  }) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                     image: NetworkImage(widget.event.imageUrl ?? ''),
                   fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.event.name??'', style: TextStyle(fontFamily: "Spartan",fontSize: 38, fontWeight: FontWeight.w500)),
                  SizedBox(height: 30),
                  Text(widget.event.description??'',
                      style: TextStyle(fontFamily: "Spartan",fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400)),
                  SizedBox(height: 60),
                 /* Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(widget.event.user.i),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.event.,
                              style: TextStyle(fontFamily: "Spartan",fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                           
                          ],
                        ),
                      ],
                    ),
                  ),*/
                  SizedBox(height: 60),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}