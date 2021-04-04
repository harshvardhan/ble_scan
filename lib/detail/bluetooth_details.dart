import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BluetoothDevice bluetoothDevice = ModalRoute.of(context).settings.arguments;
    String name = bluetoothDevice.name.isEmpty ? bluetoothDevice.hashCode.toString() : bluetoothDevice.name;
    String macID = bluetoothDevice.id.id.toString();

    return MaterialApp(
        title: 'Bluetooth Scanner',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bluetooth Device Details",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade100,
                        fontFamily: "Source Sans Pro",
                        letterSpacing: 2.5
                    )
                ),
                SizedBox(height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Text("Name",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "Source Sans Pro",
                          fontSize: 20.0
                      ),
                    ),
                    title: Text(name,
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "Source Sans Pro",
                          fontSize: 20.0
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Text("Mac ID",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "Source Sans Pro",
                          fontSize: 20.0
                      ),
                    ),
                    title: Text(macID,
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "Source Sans Pro",
                          fontSize: 20.0
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}