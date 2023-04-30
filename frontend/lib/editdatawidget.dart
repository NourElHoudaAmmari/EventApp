import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/api_service.dart';
import 'models/Events.dart';


class EditDataWidget extends StatefulWidget {
  const EditDataWidget({Key? key, required this.events}) : super(key: key);

  final Events events;
  @override
  State<EditDataWidget> createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
   final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _dureeController = TextEditingController();
   final _nbplace = TextEditingController();
  @override
  void get initState {
    id = widget.events.id!;
    _nameController.text = widget.events.name!;
    _locationController.text = widget.events.location!;
    _imageUrlController.text = widget.events.imageUrl!;
    _dateController.text = widget.events.date!;
    _dureeController.text = widget.events.duree!;
    _nbplace.text = widget.events.nbplace!;
    _descriptionController.text = widget.events.description!;

    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Event'),
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
      'Event Name',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _nameController,
  decoration: InputDecoration(
    hintText: 'Event Name',
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
      return 'Please enter Event name';
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
      'Description',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
     // définir la hauteur souhaitée du TextFormField
     TextFormField(
        controller: _descriptionController,
        decoration: InputDecoration(
          hintText: 'description',
          contentPadding: EdgeInsets.symmetric(vertical: 55.0), // définir la marge interne de la zone de saisie
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
        maxLines: null, // permet à l'utilisateur d'écrire autant de lignes qu'il souhaite
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter description';
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
      'Location',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _locationController,
  decoration: InputDecoration(
    hintText: 'Location',
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
      return 'please enter location';
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
      'Date',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _dateController,
  decoration: InputDecoration(
    hintText: 'Date',
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
      return 'please enter date';
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
      'Duration',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _dureeController,
  decoration: InputDecoration(
    hintText: 'Duration',
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
      return 'please enter duration';
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
                             Text(
      'Number of places',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
   keyboardType: TextInputType.number,
  controller: _nbplace,
  decoration: InputDecoration(
    hintText: 'number of places',
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
      return 'please enter number of places';
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
                              const Text('image'),
                              TextFormField(
                                controller: _imageUrlController,
                                decoration: const InputDecoration(
                                  hintText: 'image',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter image';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        
                       Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.updateCases(id, Events(name: _nameController.text, location:_locationController.text, imageUrl: _imageUrlController.text, date: _dateController.text, duree: _dureeController.text,nbplace: _nbplace.text,description: _descriptionController.text, updated: DateTime.now().toString(), id: '')).whenComplete(() => Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/')));



                                  }
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