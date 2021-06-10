import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_movies/models/soccer.dart';
import 'package:hello_movies/widgets/soccerWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  List<Soccer> _soccer = new List<Soccer>();

  @override
  void initState() {
    super.initState();
    _populateAllSoccer();
  }

  void _populateAllSoccer() async {
    final soccer = await _fetchAllSoccer();
    setState(() {
      _soccer = soccer;
    });
  }

  Future<List<Soccer>> _fetchAllSoccer() async {
    final response =
        await http.get("http://127.0.0.1:8000/api/v1/auth/artikle");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result;
      return list.map((soccer) => Soccer.fromJson(soccer)).toList();
    } else {
      throw Exception("Failed to load soccer!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Soccer News",
        home: Scaffold(
            appBar: AppBar(title: Text("Soccer")),
            body: SoccerWidget(soccers: _soccer)));
  }
}
