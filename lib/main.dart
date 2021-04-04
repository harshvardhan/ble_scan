import 'package:ble_scan/detail/bluetooth_details.dart';
import 'package:ble_scan/home/home_screen.dart';
import 'package:ble_scan/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        Routes.home: (context) => HomeScreen(title: 'Bluetooth Scanner'),
        Routes.deviceDetails: (context) => BluetoothDetails()
      },
      initialRoute: Routes.home,
    );
  }
}
