class Connection {
  final String id;
  final String host;
  final int port;
  late bool connected;
  Connection({
    required this.id,
    required this.host,
    required this.port,
    this.connected = false,
  });
}
