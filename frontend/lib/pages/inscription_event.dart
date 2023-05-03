import 'package:flutter/material.dart';
import 'package:frontend/shared/theme.dart';

class InscriptionEvent extends StatefulWidget {
  const InscriptionEvent({super.key});

  @override
  State<InscriptionEvent> createState() => _InscriptionEventState();
}

class _InscriptionEventState extends State<InscriptionEvent> {
  final _addFormKey = GlobalKey<FormState>();
  final _username = TextEditingController();
    final _userlastname= TextEditingController();
  final _mail = TextEditingController();
  final _phonenumber = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: orangeColor,
        title: const Text('Event registration'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                                 Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'First Name',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _username,
  decoration: InputDecoration(
    hintText: 'FirstName',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
      
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  },
       onChanged: (value) {},
),
  ],
),

                            ],
                          ),
                        ),
                
SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                             Text(
      'Last Name',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _userlastname,
  decoration: InputDecoration(
    hintText: 'Last Name',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'please enter last name';
    }
    return null;
  },
   onChanged: (value) {},
),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                                                Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                             Text(
      'Email',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _mail,
  decoration: InputDecoration(
    hintText: 'Email',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    return null;
  },
   onChanged: (value) {},
),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                         Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                             Text(
      'Phone Number',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _phonenumber,
     keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: 'Phone number',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'please enter your phone number';
    }
    return null;
  },
   onChanged: (value) {},
),
                            ],
                          ),
                        ),
                       const  SizedBox(height: 10,),
    
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                },
                                child: const Text('Save', style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}