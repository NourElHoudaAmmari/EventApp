import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';


void _launchURL() async =>

    // ignore: deprecated_member_use
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
const _url = 'https://meet.google.com/';

class Stream_Page extends StatefulWidget {
  const Stream_Page({super.key});

  @override
  State<Stream_Page> createState() => _Stream_PageState();
}

class _Stream_PageState extends State<Stream_Page> {
  @override
  Widget build(BuildContext context) {
     return Theme(
      data: ThemeData( 
        brightness: Brightness.light,
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: KBackgroundColor,
        useMaterial3: true,),
       
     
     child:Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/chat1.png"),
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Attend Your Meeting",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ]),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 239, 130, 29)),
                  onPressed: () {
                    _launchURL();
                  },
                  child: Text(
                    "Google Meet",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )),
        ],
      ),
    ));
  }
}