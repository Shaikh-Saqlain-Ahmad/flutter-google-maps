import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LatLngToAddress extends StatefulWidget {
  const LatLngToAddress({super.key});

  @override
  State<LatLngToAddress> createState() => _LatLngToAddressState();
}

class _LatLngToAddressState extends State<LatLngToAddress> {
  String stAddress = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("google maps"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              setState(() {
                stAddress = locations.last.longitude.toString() +
                    "" +
                    locations.last.latitude.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          ),
          Text(stAddress)
        ],
      ),
    );
  }
}
