import 'package:ble_scan/list/bluetooth_devices_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool scanning = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  BluetoothDevice device;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> dta = [];

  startStop() {
    if (scanning) {
      flutterBlue.stopScan();
    } else {
      flutterBlue.scanResults.listen((List<ScanResult> results) {
        for (ScanResult result in results) {
          _addDeviceToList(result.device);
        }
      });
      flutterBlue.startScan(timeout: Duration(seconds: 4));
    }
    setState(() {
      scanning = !scanning;
    });
  }

  _addDeviceToList(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          TextButton(
            child: Text(
              scanning ? "Stop Scanning" : "Start Scanning",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              startStop();
            },
          )
        ],
      ),
      body: SafeArea(
          child: BluetoothDevicesList(
            bluetoothDevices: devicesList,
            onClick: () => _onDeviceClick(context),
          )
      ),
    );
  }

  void _onDeviceClick(BuildContext context) {
    setState(() {
      scanning = false;
    });
  }
}
