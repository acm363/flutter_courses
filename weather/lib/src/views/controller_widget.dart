import 'package:flutter/material.dart';


class ControllerWidget extends StatelessWidget {
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;

  const ControllerWidget({
    Key? key,
    required this.latitudeController,
    required this.longitudeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text("Latitude: ",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Expanded(
              child: TextField(
                controller: latitudeController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              )),
          const SizedBox(width: 50),
          const Text("Longitude: ",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Expanded(
              child: TextField(
                controller: longitudeController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              )),
        ],
      ),
    );
  }
}
