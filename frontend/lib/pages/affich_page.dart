

import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/widgets/EventsList.dart';
import 'package:frontend/models/Events.dart';
import 'package:frontend/pages/mainDrawer.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';
import 'package:frontend/widgets/Events_edit_delete.dart';

class Affich extends StatefulWidget {
  
  const Affich({Key? key}) : super(key: key);

  @override
  State<Affich> createState() => _AffichState();
}

class _AffichState extends State<Affich> {
    final ApiService api = ApiService();
   
   late Future<List<Events>> eventList;
  @override
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState;

    setState(() {
      eventList = api.getEvents() ;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      key: _key,
        backgroundColor: backgroundColor,
      drawer:const MainDrawer(),
      appBar: AppBar(
         
       title:  Text(
          "Events List",
          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
      
        elevation: 0.0,

 backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon:const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
          actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white
              ),
              onPressed: () {}),
        ],
          
      ),
       body: Column(
        children: [
       
      SizedBox(height: 16,),
          Container
           (width: 380,
         
            child: 
          TextField(
   // controller: _searchController,
    onChanged: (value) {
      
    },
    decoration: InputDecoration(
      hintText: 'Search',
      prefixIcon: Icon(Icons.search,color: Colors.grey,),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      
    ),
    cursorColor: Colors.grey,
    
  ),
          ),
          SizedBox(height: 19,),
          Expanded(
            child:FutureBuilder(
      future: eventList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return EventEditDelete(events:snapshot.data!);
        } if(snapshot.hasError) {
          return  Center(child: Text('Some error occurred ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    ), 
            ),
        ],
       ),
  );  
  }
}

