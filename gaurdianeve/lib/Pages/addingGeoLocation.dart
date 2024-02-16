import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddRedzoneScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Redzone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Latitude'),
              controller: latitudeController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Longitude'),
              controller: longitudeController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Radius'),
              controller: radiusController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addRedzone(
                  nameController.text,
                  double.tryParse(latitudeController.text) ?? 0.0,
                  double.tryParse(longitudeController.text) ?? 0.0,
                  double.tryParse(radiusController.text) ?? 0.0,
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Redzone added'),
                ));
              },
              child: Text('Add Redzone'),
            ),
          ],
        ),
      ),
    );
  }

  void addRedzone(String name, double latitude, double longitude, double radius) {
    FirebaseFirestore.instance.collection('redzones').add({
      'name': name,
      'position': {
        'latitude': latitude,
        'longitude': longitude,
      },
      'radius': radius,
    });
  }
}
