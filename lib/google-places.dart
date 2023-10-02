import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlacesApi extends StatefulWidget {
  const GooglePlacesApi({super.key});

  @override
  State<GooglePlacesApi> createState() => _GooglePlacesApiState();
}

class _GooglePlacesApiState extends State<GooglePlacesApi> {
  dynamic placelist = [];
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String sessionToken = "123456";
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyAs6L4bduS-f-Vx0i9u1M785IwL6uSs2M0";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    print(response.body.toString());
    var data = response.body.toString();
    if (response.statusCode == 200) {
      setState(() {
        placelist = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Places Api"),
        centerTitle: true,
      ),
      body: Column(children: [
        TextFormField(
          controller: _controller,
          decoration:
              InputDecoration(hintText: "Search Places you want to see"),
        )
      ]),
    );
  }
}
//ONLY NEED TO DISPLAY DATA IN LIST VIEW BUT CANNOT PROGRESS DUE TO DISABLED BILLING