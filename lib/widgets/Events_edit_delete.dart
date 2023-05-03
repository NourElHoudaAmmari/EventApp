



import 'package:flutter/material.dart';
import 'package:frontend/models/Events.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/detailwidget.dart';
import 'package:frontend/widgets/editdatawidget.dart';

class EventEditDelete extends StatefulWidget {
   final List<Events> events;
 const EventEditDelete({Key? key, required this.events}) : super(key: key);

  @override
  State<EventEditDelete> createState() => _EventEditDeleteState();
}

class _EventEditDeleteState extends State<EventEditDelete> {
    final ApiService api = ApiService();
  @override
  Widget build(BuildContext context) {
 return
     GridView.builder(
  //  padding: EdgeInsets.all(8),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, //Number of columns
    childAspectRatio: 0.9, //Ratio of height to width of each grid item
  ),
  itemCount: widget.events == null ? 0 : widget.events.length,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailWidget(events: widget.events[index],),
            ),
          );
        },
        child :  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image(
                  image: AssetImage('assets/img_event_1.png'),
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.events[index].name ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 6,),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 8,),
                    Expanded(
                      child: Text(
                        widget.events[index].description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade800,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              _navigateToEditScreen(context,  widget.events[index]);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                             _confirmDialog(context, index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
  }
_navigateToEditScreen(BuildContext context, Events events) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(events: events,)),
    );
  }

  Future<void> _confirmDialog(BuildContext context, int index) async {
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
              api.deleteCase(widget.events[index].id!);
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