import 'package:frontend/constant.dart';

import '../models/inscription.dart';
import '../services/inscription_service.dart';
import 'package:flutter/material.dart';

import '../shared/theme.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({Key? key, required this.inscriptions}) : super(key: key);

  final Inscription inscriptions;
  

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
    final InscriptionService api = InscriptionService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(' Inscription Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 10),
        
                    // const SizedBox(height: 6),
                        
                            
      SizedBox(height: 10),
                 const Text(
                   "Informations :",
                   style: TextStyle(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                     color:Colors.black,
                   ),
                   textAlign: TextAlign.left,
                 ),
                 SizedBox(height: 15),
  
                Row(
  children: [
                                
    Text(
      'Name :',
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    ),
     SizedBox(width: 8),
    Text(
    widget.inscriptions.prenom??"",
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 31, 31, 31),
      ),
      textAlign: TextAlign.left,
    ),

    
  ],
),
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [
            Text(
              'Last Name : ',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
                Text(
    widget.inscriptions.nom??"",
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

      
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [
            Text(
              'E-mail : ',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
                Text(
    widget.inscriptions.mail??"",
    
      style: const TextStyle(
        fontSize: 9,
        color: Color.fromARGB(255, 118, 117, 117),
      ),
      //textAlign: TextAlign.left,
    ),
          ],
        ),
      ],

      ),
      
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [
            Text(
              'Phone Number : ',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
                Text(
    widget.inscriptions.numtel.toString(),
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
         
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [
            Text(
              'address : ',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
                Text(
    widget.inscriptions.adresse??"",
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 118, 117, 117),
      ),
      //textAlign: TextAlign.left,
    ),
          ],
        ),
      ],

      ),
               ]
                     ),
  
                  )
                  
                )
             );

      
  }

  Future<void> _confirmDialog() async {
    print(widget.inscriptions.mail);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
               // api.deleteCase(widget.events.id!);
                //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}