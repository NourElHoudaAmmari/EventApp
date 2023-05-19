import 'package:flutter/material.dart';
import 'package:frontend/models/inscription.dart';
import 'package:intl/intl.dart';
import '../services/inscription_service.dart';
import 'details_widget.dart';

class InscriptionnsList extends StatefulWidget {
  final List<Inscription> inscriptions;
  InscriptionnsList({Key, required this.inscriptions});

  @override
  _InscriptionnsListState createState() => _InscriptionnsListState();
}

class _InscriptionnsListState extends State<InscriptionnsList> {
  final InscriptionService api = InscriptionService();

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      
        itemCount: widget.inscriptions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsWidget(
                      inscriptions: widget.inscriptions[index],
                    ),
                  ),
                );
              },
              
              child: Container(
                color: Colors.grey[100],
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                      '${widget.inscriptions[index].prenom ?? ''} ${widget.inscriptions[index].nom ?? ''}'),
                  subtitle: Text(widget.inscriptions[index].numtel.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      bool? result = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirmation"),
                            content: Text(
                                "Are you sure you want to delete this inscription?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text("Delete"),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      if (result == true) {
                        await api.deleteInscription(
                            widget.inscriptions[index].id ?? '');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Inscription ${widget.inscriptions[index].nom} deleted successfully."),
                            action: SnackBarAction(
                              label: "UNDO",
                              onPressed: () {
                                // Add code here to undo the deletion
                                setState(() {
                                  widget.inscriptions.insert(
                                      index, widget.inscriptions[index]);
                                });
                              },
                            ),
                          ),
                        );
                        setState(() {
                          widget.inscriptions.removeAt(index);
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
