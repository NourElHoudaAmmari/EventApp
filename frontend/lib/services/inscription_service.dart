import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/models/inscription.dart';
import 'package:http/http.dart';

//ALL THE CRUD METHODS WILL BE FOUND HERE
class InscriptionService {
  final Uri apiUrl = Uri.parse("http://localhost:3000/inscriptions");

  //GET METHOD (ALL)
  Future<List<Inscription>> getInscriptions() async {
    Response res = await get(
      apiUrl );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Inscription> inscriptions =
          body.map((dynamic item) => Inscription.fromJson(item)).toList();
      return inscriptions;
     
    } else {
      throw "Failed to load inscription list";
    }
    
  }

  //GET METHOD (per id)
  Future<Inscription> getInscriptionById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Inscription.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load an inscription');
    }
  }

  //POST METHOD
  Future<Inscription> createInscription(Inscription inscriptions) async {
    Map data = {
      'nom': inscriptions.nom,
      'prenom': inscriptions.prenom,
      'numtel':inscriptions.numtel,
     ' mail':inscriptions.mail,
      'adresse' : inscriptions.adresse,
      'updated': inscriptions.updated

       
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Inscription.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post inscription');
    }
  }

  //UPDATE METHOD
  Future<Inscription> updateInscription(String id, Inscription inscriptions) async {
    Map data = {
      'nom': inscriptions.nom,
      'prenom': inscriptions.prenom,
      'numtel':inscriptions.numtel,
     ' mail':inscriptions.mail,
      'adresse' : inscriptions.adresse,
      'updated': inscriptions.updated
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Inscription.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update an inscription');
    }
  }

  //DELETE METHOD
  Future<void> deleteInscription(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      debugPrint("Inscription deleted");
    } else {
      throw "Failed to delete an inscription.";
    }
  }
}