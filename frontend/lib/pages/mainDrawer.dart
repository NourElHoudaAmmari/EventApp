

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/models/Events.dart';
import 'package:frontend/pages/affich_page.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/EventsList.dart';

import 'package:frontend/widgets/Events_edit_delete.dart';
import 'package:frontend/widgets/adddatawidget.dart';
import 'package:frontend/main.dart';
import 'package:frontend/pages/home_page.dart';

import 'inscription_list.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String? getCurrentUserEmail() {
  User? user = FirebaseAuth.instance.currentUser;
  String? email = user!.email;
  return email;
}
     late final List<Events> events;
  
   @override
   void initState() {
    super.initState();
     
  }
  @override
  Widget build(BuildContext context) {
      String? email = getCurrentUserEmail();
   return Drawer(
      child: Column(
        children:<Widget> [
Container(
  width: double.infinity,
  padding: EdgeInsets.all(20),
  color: kPrimaryColor,
  child: Center(
    child: Column(
      children: <Widget> [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 10,
          ),
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage( "assets/img_profile.png",),
            fit: BoxFit.fill),
            
          ),
        ),
        Text(  
"",
   style: TextStyle(
   fontSize: 22,
  color: Colors.white,
 fontWeight: FontWeight.bold,),
    ),
 Text(' $email',
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
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
  },
),
ListTile(
  leading: const Icon(Icons.person),
  title: const Text(
    'Profile',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: (){
      
  },
),
ListTile(
  leading: const Icon(Icons.post_add),
  title:const Text(
    'Event',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: (){
    print("entred");
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Affich()),
            );
  },
),
ListTile(
  leading: const Icon(Icons.login_rounded),
  title:const Text(
    'Inscriptions',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: (){
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  InscriptionList()),
            );
  },
),

ListTile(
  leading:const  Icon(Icons.settings),
  title:const  Text(
    'Settings',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  onTap: null,
),
ListTile(
  leading: const Icon(Icons.power_settings_new),
  title:const  Text(
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