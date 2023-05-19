import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/services/inscription_service.dart';
import '../models/inscription.dart';
import '../shared/theme.dart';

class InscriptionEvent extends StatefulWidget {
  const InscriptionEvent({Key? key}) : super(key: key);

  @override
  State<InscriptionEvent> createState() => _InscriptionEventState();
}

class _InscriptionEventState extends State<InscriptionEvent> {

    final InscriptionService api = InscriptionService();
  final _addFormKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
   final prenomController = TextEditingController();
  final mailController = TextEditingController();
  final numtelControllerl = TextEditingController();
   final adresseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
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
  controller: prenomController,
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
  controller: nomController,
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
  controller: mailController,
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
      'Adress',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: adresseController,
  decoration: InputDecoration(
    hintText: 'Adresse',
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
      return 'please enter your location';
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
  controller: numtelControllerl,
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
                                onPressed: (){
                                  if(_addFormKey.currentState!.validate()){
                                     _addFormKey.currentState!.save();
 api.createInscription(Inscription(nom : nomController.text,
     prenom : prenomController.text,
   numtel :int.parse(numtelControllerl.text),
     mail : mailController.text,
     adresse : adresseController.text)
     
     );
        Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
        ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        'Inscription add succefully',
        style: TextStyle(color: Colors.white),
      ),
    ),
    );

                                    //_addinscription;
                                  }
                                  },
                                
                                   style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 4, 41, 72),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
                                child: const Text('Save', style: TextStyle(color: Colors.white)),
                              ),
                              
                            ],
                            
                          ),
                        ),
                      ],
                    ),
        
                )
            ),
          ),
          
        ),
      ),
    );
  }
}
