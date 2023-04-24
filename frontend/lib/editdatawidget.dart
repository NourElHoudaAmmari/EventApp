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
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();
  @override
  void initState() {
    id = widget.events.id;
    _nameController.text = widget.events.name;
    _locationController.text = widget.events.location;
    _imageUrlController.text = widget.events.imageUrl;
    _dateController.text = widget.events.date;
    _monthController.text = widget.events.month;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Cases'),
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
                                controller: _locationController ,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
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
                              const Text('Date'),
                              TextFormField(
                                controller: _dateController,
                                decoration: const InputDecoration(
                                  hintText: 'Date',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Date';
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
                                    api.updateCases(id, Events(name: _nameController.text, location:_locationController.text, imageUrl: _imageUrlController.text, date: _dateController.text, month: _monthController.text, updated: DateTime.now().toString(), id: '')).whenComplete(() => Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/')));



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