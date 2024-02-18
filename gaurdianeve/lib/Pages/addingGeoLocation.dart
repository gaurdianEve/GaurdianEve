import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRedzoneScreen extends StatefulWidget {
  @override
  State<AddRedzoneScreen> createState() => _AddRedzoneScreenState();
}

class _AddRedzoneScreenState extends State<AddRedzoneScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController latitudeController = TextEditingController();

  final TextEditingController longitudeController = TextEditingController();

  final TextEditingController radiusController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications()

      }
    });
    super.initState();

  }

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
              decoration:const InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Latitude'),
              controller: latitudeController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Longitude'),
              controller: longitudeController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Radius'),
              controller: radiusController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // addRedzone(
                //   nameController.text,
                //   double.tryParse(latitudeController.text) ?? 0.0,
                //   double.tryParse(longitudeController.text) ?? 0.0,
                //   double.tryParse(radiusController.text) ?? 0.0,
                // );
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //   content: Text('Redzone added'),
                // ));
                triggerNotification();
              },
              child: const Text('Add Redzone'),
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
  triggerNotification(){
    AwesomeNotifications().createNotification(
  content: NotificationContent(
      id: 10,
      channelKey: 'basic_channel',
      actionType: ActionType.Default,
      title: 'Hello World!',
      body: 'This is my first notification!',
  )
);
  }
}
