import 'package:flutter/material.dart';
import 'package:frontend/pages/mainDrawer.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';

import 'adddatawidget.dart';
import 'EventsList.dart';
import 'models/Events.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
return MaterialApp(
      title: ' Events App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  late Future<List<Events>> casesList;

  @override
  void initState() {
    super.initState();

    setState(() {
      casesList = api.getCases();
    });
  }
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
 int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
     Widget header() {
      return Container(
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
                    'Hello, Mohamed',
                    style: placeholderTextStyle,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Discover our events',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
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
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget data(){
      return FutureBuilder(
           
            future: casesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return EventsList(events: snapshot.data!);
              } else {
                return Center(
                    child: Text('No data found, tap plus button to add!',
                        style: Theme.of(context).textTheme.headline6));
              }
            },
          );
    }
        Widget search() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: 54,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ic_search.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search all events...',
                  hintStyle: placeholderTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }
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
          builder: (context) => const MyHomePage(),
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
           icon:GestureDetector(
            onTap: (){

            },
            child:   Image.asset(
             'assets/ic_favorite.png',
              width: 24,
              color: currentIndex == 1 ? orangeColor : greyColor,
            ),
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
              color: currentIndex == 4 ? orangeColor : greyColor,
            ),
            label: 'Profile',
          ),
      BottomNavigationBarItem(
  icon: GestureDetector(
    onTap: () {
     /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ,
        ),
      );*/
    },
    child: Icon(Icons.videocam_outlined,size: 29,color:Colors.grey),
  ),
  label: 'Live',
),
        ],
      );
    }
    return Scaffold(
       key: _key,
        backgroundColor: backgroundColor,
      drawer:const MainDrawer(),
      appBar: AppBar(
         
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
       title: Text(
          "Events App",
          style: TextStyle(color: Colors.deepOrange[800], fontSize: 20,fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,

        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon:const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 103, 103, 103),
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
          
      ),
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            search(),
            data(),
          ],
        ),
         ),
          bottomNavigationBar: customBottomNavbar(),

    );
  }
}

