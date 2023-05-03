import 'package:flutter/material.dart';
import 'package:frontend/pages/mainDrawer.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';
import 'package:frontend/widgets/Events_edit_delete.dart';

import 'widgets/adddatawidget.dart';
import 'models/Events.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // primarySwatch: Colors.blue,
      ),
      home: const MainPage(),

    );
  }
}