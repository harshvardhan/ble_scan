import 'package:ble_scan/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class LocalNavigator {
  final NavigatorState _navigator;

  LocalNavigator(this._navigator);

  toHome() {
    _navigator.pushNamedAndRemoveUntil(Routes.home,
        (_) => false); //prevent going back to previous screens
  }

  popUntilHome() {
    _navigator.popUntil(ModalRoute.withName(Routes.home));
  }

  toDeviceDetails(BluetoothDevice device) {
    _navigator.pushNamed(Routes.deviceDetails, arguments: device);
  }

  pop() {
    _navigator.pop();
  }

}
