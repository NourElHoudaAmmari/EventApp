import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/models/Events.dart';
import 'package:http/http.dart';

//ALL THE CRUD METHODS WILL BE FOUND HERE
class ApiService {
  final String apiUrl = "http://localhost:3000/events";

  //GET METHOD (ALL)
  Future<List<Events>> getCases() async {
    Response res = await get(
      Uri.parse(apiUrl),
      headers: {"Accept": "application/json"},
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Events> events =
          body.map((dynamic item) => Events.fromJson(item)).toList();
      return events;
    } else {
      throw "Failed to load cases list";
    }
  }

  //GET METHOD (per id)
  Future<Events> getCaseById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Events.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  //POST METHOD
  Future<Events> createCase(Events events) async {
    Map data = {
      'name': events.name,
      'location': events.location,
      'imageUrl': events.imageUrl,
      'date': events.date,
      'duree': events.duree,
      'description': events.description,
      'nbplace': events.nbplace,
      'updated': events.updated
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Events.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  //UPDATE METHOD
  Future<Events> updateCases(String id, Events events) async {
    Map data = {
      'name': events.name,
      'location': events.location,
      'imageUrl': events.imageUrl,
      'date': events.date,
      'duree': events.duree,
      'description': events.description,
      'nbplace': events.nbplace,
      'updated': events.updated
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Events.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  //DELETE METHOD
  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      debugPrint("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
