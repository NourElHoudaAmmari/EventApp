import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/models/inscription.dart';
import 'package:frontend/services/inscription_service.dart';
import 'package:frontend/shared/theme.dart';

import 'inscriptionn_list.dart';

class InscriptionList extends StatefulWidget {
  const InscriptionList({super.key});

  @override
  State<InscriptionList> createState() => _InscriptionListState();
}

class _InscriptionListState extends State<InscriptionList> {

   final InscriptionService api = InscriptionService();
  late Future<List<Inscription>> inscriptionList;

 @override
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

 @override
  void get initState {
    super.initState;

    setState(() {
      inscriptionList = api.getInscriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    key: _key,
      appBar: AppBar(
      backgroundColor: orangeColor,
        title: const Text("Inscription List"),
      ),
      body: Center(
          child: FutureBuilder(
        future: inscriptionList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InscriptionnsList(inscriptions:snapshot.data!);
          } if(snapshot.hasError) {
          return  Center(child: Text('Some error occurred ${snapshot.error}'));
        }
         return Center(child: CircularProgressIndicator());
        },
      )
      ),
   
    
    );
  }
}