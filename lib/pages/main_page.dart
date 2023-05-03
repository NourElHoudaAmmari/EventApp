

import 'package:flutter/material.dart';
import 'package:frontend/widgets/adddatawidget.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/shared/theme.dart';

import 'Stream_Page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
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

    return Scaffold(
      body: const HomePage(),
      bottomNavigationBar: customBottomNavbar(),
    );
  }
}