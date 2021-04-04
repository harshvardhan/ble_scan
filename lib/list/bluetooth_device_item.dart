import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDevicesItem extends StatelessWidget {
  final BluetoothDevice device;
  final GestureTapCallback onClick;

  BluetoothDevicesItem({
    @required this.device,
    @required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    Widget card;
    String name = this.device.name.isEmpty ? this.device.hashCode.toString() : this.device.name;

    card = Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
      child: ListTile(
        onTap: onClick,
        contentPadding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
        title: Center(
          child: Text(name,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal.shade900,
                  fontFamily: "Source Sans Pro",
                  letterSpacing: 2.5
              )
          ),
        ),
      ),
    );
    return card;
  }

}