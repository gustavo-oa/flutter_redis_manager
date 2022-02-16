import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redismanager/models/connection.dart';

class ConnectionList with ChangeNotifier {
  Map<String, Connection> _connections = {};

  List<Connection> get connections => [..._connections.values];
  int get totalConnections => _connections.length;

  void add(Connection conn) {
    if (_connections[conn.id] == null) {
      return;
    }

    _connections.putIfAbsent(conn.id, () => conn);
    notifyListeners();
  }

  void remove(Connection conn) {
    if (_connections[conn.id] == null) {
      return;
    }

    _connections.remove(conn.id);
    notifyListeners();
  }

  void connect(Connection conn) {
    if (_connections[conn.id] == null) {
      return;
    }

    _connections.update(
      conn.id,
      (value) => Connection(
        host: value.host,
        port: value.port,
        id: value.id,
        connected: true,
      ),
    );

    notifyListeners();
  }
}
