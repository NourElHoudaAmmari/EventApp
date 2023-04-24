import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';

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
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Rest API"),
      ),
      body: Center(
          child: FutureBuilder(
            // future: api.getCases(),
            // builder: (context, snapshot) {
            //   if(snapshot.hasData){
            //     return CasesList(cases: snapshot.data!);
            //   }else{
            //     return Center(child: Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.headline6));
            //   }
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
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _navigateToAddScreen(BuildContext context) async {
    final result= await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddDataWidget()));
  }
}

