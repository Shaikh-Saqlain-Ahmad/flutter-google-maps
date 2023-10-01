import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kgooglePlex =
      CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14.45);
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: "My location")),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(33.0004, 73.5555),
        infoWindow: InfoWindow(title: "Yahan thula hai"))
  ];

  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kgooglePlex,
          mapType: MapType.normal, //satellite etc.
          myLocationEnabled: true,
          compassEnabled: false,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(33.0004, 73.5555), zoom: 14)));
          setState(() {});
        },
        child: Icon(Icons.location_disabled_sharp),
      ),
    );
  }
}
