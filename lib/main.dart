import 'package:flutter/material.dart';
import 'package:flutter_google_maps/google-places.dart';
import 'package:flutter_google_maps/latlng-to-address.dart';
import 'package:flutter_google_maps/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GooglePlacesApi(),
    );
  }
}
