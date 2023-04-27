import 'package:flutter/material.dart';
import 'editdatawidget.dart';
import 'services/api_service.dart';
import 'models/Events.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({Key? key, required this.events}) : super(key: key);

  final Events events;

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
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
                            Text('Name:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.name,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                          Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Description:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.description,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Location:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.location,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                          Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Date:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.date,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                          Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Duration:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.duree,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                          Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Number of places:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.nbplace,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('image:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.events.imageUrl,
                                style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                      


                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  _navigateToEditScreen(context, widget.events);
                                },
                                child: const Text('Edit',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _confirmDialog();
                              },
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Events events) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(events: events,)),
    );
  }

  Future<void> _confirmDialog() async {
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
                api.deleteCase(widget.events.id);
                Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
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