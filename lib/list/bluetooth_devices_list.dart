import 'package:ble_scan/list/bluetooth_device_item.dart';
import 'package:ble_scan/utils/local_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDevicesList extends StatelessWidget {
  List<BluetoothDevice> bluetoothDevices;
  final GestureTapCallback onClick;

  BluetoothDevicesList({
    Key key,
    @required this.bluetoothDevices,
    @required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    Widget listBody;
    listBody = Container(child:
    ListView.builder(
        itemCount: this.bluetoothDevices.length,
        itemBuilder: (BuildContext context, int index) {
      final bluetoothDevice = bluetoothDevices[index];
      return BluetoothDevicesItem(
        device: bluetoothDevice,
        onClick: () => _onDeviceClick(context, bluetoothDevice),
      );
    })
    );
    return listBody;
  }

  void _onDeviceClick(BuildContext context, BluetoothDevice bluetoothDevice) {
    onClick();
    LocalNavigator(Navigator.of(context)).toDeviceDetails(bluetoothDevice);
  }
}