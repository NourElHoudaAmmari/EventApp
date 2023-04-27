

import 'package:flutter/material.dart';
import 'package:frontend/adddatawidget.dart';
import 'package:frontend/main.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
   return Drawer(
      child: Column(
        children:<Widget> [
Container(
  width: double.infinity,
  padding: EdgeInsets.all(20),
  color: Colors.blue[700],
  child: Center(
    child: Column(
      children: <Widget> [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(
            top: 30,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage( "assets/img_profile.png",),
            fit: BoxFit.fill),
            
          ),
        ),
        Text(  
 "Mohamed ",
   style: TextStyle(
   fontSize: 22,
  color: Colors.white,
 fontWeight: FontWeight.bold,),
    ),
 Text(  
 "Mohamed@gmail.com",
   style: TextStyle(
    color: Colors.white,
   fontWeight: FontWeight.normal,),
     ),
      ],
    ),
  ),
),
ListTile(
  leading: Icon(Icons.home),
  title: Text(
    "Page d'accueil",
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap:(){
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
  },
),
ListTile(
  leading: Icon(Icons.person),
  title: Text(
    'Profile',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: (){
      
  },
),
ListTile(
  leading: Icon(Icons.post_add),
  title: Text(
    'Event',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: (){
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddDataWidget()),
            );
  },
),

ListTile(
  leading: Icon(Icons.settings),
  title: Text(
    'Paramétres',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: null,
),
ListTile(
  leading: Icon(Icons.power_settings_new),
  title: Text(
    'Logout',
    style: TextStyle(
      fontSize: 18,
      color: Colors.red,
    ),
  ),
  onTap:  (){
        
          
                  }
),
        ],
      ),
    );
  }
}