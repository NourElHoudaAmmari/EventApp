import 'package:flutter/material.dart';
import 'package:frontend/pages/inscription_list.dart';
import 'package:frontend/pages/inscription_screen.dart';
import 'package:frontend/shared/theme.dart';
import 'package:intl/intl.dart';
import 'editdatawidget.dart';
import 'services/api_service.dart';
import 'models/Events.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({Key? key, required this.events}) : super(key: key);

  final Events events;

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();
bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text(' Event Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 10),
                 Container(
                  height: 280.0,
                  width: 600.0,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                   padding: const EdgeInsets.all(5.0),
                  child: Image(
        image: NetworkImage('assets/img_event_1.png'),
        fit: BoxFit.cover,
       
      ),
                 ),
                     const SizedBox(height: 6),

          
                                     Text(" Event Name : "'${widget.events.name??""}',
                                     style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                             ),
                               SizedBox(height: 3,),
                               Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
"Published : ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(widget.events.updated??""))}",
      style: const TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        color: Color.fromARGB(255, 92, 92, 92),
      ),
      textAlign: TextAlign.left,
    ),
    IconButton(
      icon: Icon(_isLiked? Icons.favorite : Icons.favorite_border),
      color: _isLiked ? Colors.red : Colors.black,
      onPressed: () {
      },
      
    ),
  ],
),
                            
      SizedBox(height: 10),
                 const Text(
                   "Informations :",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                     color:Colors.black,
                   ),
                   textAlign: TextAlign.left,
                 ),
                 SizedBox(height: 8),
                     Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Date',
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 6,),
  
                Row(
  children: [
    Icon(Icons.calendar_today, color: Colors.grey),
     SizedBox(width: 8),
    Text(
    widget.events.date??"",
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 118, 117, 117),
      ),
      textAlign: TextAlign.left,
    ),
  ],
),
  ],
                     ),
                     SizedBox(height: 10,),
   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Location',
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 6,),
  
                Row(
  children: [
    Icon(Icons.place_outlined, color: Colors.grey),
     SizedBox(width: 8),
    Text(
    widget.events.location??"",
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 118, 117, 117),
      ),
      textAlign: TextAlign.left,
    ),
  ],
),
  ],
                     ),
                SizedBox(height: 10,),
                Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     Text(
      'Duration',
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        fontStyle: FontStyle.italic,
         fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
     SizedBox(height: 6,),
                 Row(
  children: [
    Icon(Icons.timelapse, color: Colors.grey),
     SizedBox(width: 8),
    Text(
     widget.events.duree??"",
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 118, 117, 117),
      ),
      textAlign: TextAlign.left,
    ),
  ],
),
                 ],
                ),
                SizedBox(height: 10,),
                Divider(thickness: 2,),
                         Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     Text(
      'Description',
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 20,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.left,
    ),
     SizedBox(height: 6,),
                
                   Text(
                widget.events.description??"",
                   style: const TextStyle(
                     fontSize: 16,
                     color: Color.fromARGB(255, 118, 117, 117),
                   ),
                   textAlign: TextAlign.left,
                 ),
  ],
                         ),
                                       SizedBox(height: 12,),
                  Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Row(
    children: <Widget>[
      SizedBox(width: 5),
      
      ElevatedButton(onPressed: (){
 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>InscriptionEvent() ),
    );
      },
       child: Text(" Register"),
       ),
    ],
  ),
                  ),
  
                       
                    
                          
                    

                    /*  IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  _navigateToEditScreen(context, widget.events);
                                },
                                child: const Text('Edit',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          */


                    ],
                  ),
                )
                ),
    );
  }

  _navigateToEditScreen(BuildContext context, Events events) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(events: events,)),
    );
  }

  
}