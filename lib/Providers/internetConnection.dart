import 'package:flutter/material.dart';
import 'internet.dart';

class internetConnectionProvider extends ChangeNotifier {
  bool hasInterNetConnection = false;
  ConnectionUtil connectionStatus = ConnectionUtil.getInstance();

  static final internetConnectionProvider _instance =
      internetConnectionProvider._internal();

  factory internetConnectionProvider() {
    return _instance;
  }

  internetConnectionProvider._internal() {
    init();
  }

  void init() {
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    hasInterNetConnection = hasConnection;

    notifyListeners();
  }
}
