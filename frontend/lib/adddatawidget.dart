import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/services/api_service.dart';
import 'models/Events.dart';




class AddDataWidget extends StatefulWidget {
  const AddDataWidget({Key? key}) : super(key: key);

  @override
  State<AddDataWidget> createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
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
                              const Text('Full Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter full name';
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
                              const Text('location'),
                              TextFormField(
                                controller: _locationController,
                                decoration: const InputDecoration(
                                  hintText: 'location',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter location';
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
                              const Text('date'),
                              TextFormField(
                                controller: _dateController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter date';
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
                              const Text('month'),
                              TextFormField(
                                controller: _monthController,
                                decoration: const InputDecoration(
                                  hintText: 'Country',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter month';
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
                                    api.createCase(Events(name: _nameController.text,  location: _locationController.text, imageUrl: _imageUrlController.text, date: _dateController.text, month: _monthController.text, updated: DateTime.now().toString()));

                                    //Navigator.pop(context,(){setState(() {});});
                                    Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));

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