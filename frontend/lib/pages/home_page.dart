

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/pages/Stream_Page.dart';
import 'package:frontend/widgets/EventsList.dart';
import 'package:frontend/models/Events.dart';
import 'package:frontend/pages/mainDrawer.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';
import 'package:frontend/widgets/Events_edit_delete.dart';
import 'package:frontend/widgets/adddatawidget.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int currentIndex = 0;
  String getCurrentUserName() {
  User? user = FirebaseAuth.instance.currentUser;
  String? userName = user?.displayName;
  return userName??'';
}
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
        Widget customBottomNavbar() {
      return BottomNavigationBar(
        selectedItemColor: orangeColor,
        currentIndex: currentIndex,
        selectedLabelStyle: orangeTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: greyTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        showUnselectedLabels: true,
        items: [
         BottomNavigationBarItem(
  icon: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    },
    child: Image.asset(
      'assets/ic_home.png',
      width: 24,
      color: currentIndex == 0 ? orangeColor : greyColor,
    ),
  ),
  label: 'Home',
),
    BottomNavigationBarItem(
            icon: Image.asset(
             'assets/ic_favorite.png',
              width: 24,
              color: currentIndex == 1 ? orangeColor : greyColor,
            ),
            label: 'Favorite',
          ),      
        
        BottomNavigationBarItem(
  icon: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddDataWidget(),
        ),
      );
    },
    child: Icon(Icons.add_rounded,size: 29,color:Colors.deepOrangeAccent),
  ),
  label: '',
),
          
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_profile.png',
              width: 24,
              color: currentIndex == 3 ? orangeColor : greyColor,
            ),
            label: 'Profile',
          ),
      BottomNavigationBarItem(
  icon: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Stream_Page(),
        ),
      );
    },
    child: Icon(Icons.videocam_outlined,size: 29,color:Colors.grey),
  ),
  label: 'Live',
),
        ],
      );
    }
       String userName = getCurrentUserName();
    return Scaffold(
      bottomNavigationBar: customBottomNavbar(),
      key: _key,
        backgroundColor: Colors.white,
      drawer:const MainDrawer(),
      appBar: AppBar(
         
       title: Center(child: Text(
          "Events App",
          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
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
         Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
               'Welcome Back !',
                      style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                   
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Discover our Events',
                     style: placeholderTextStyle,
                  
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile_pic.png'),
                ),
              ),
            ),
          ],
        ),
      ),
     
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
          return EventsList(events:snapshot.data!);
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

