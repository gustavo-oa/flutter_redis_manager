import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redismanager/models/connection.dart';
import 'package:redismanager/models/connection_list.dart';
import 'package:redismanager/repository/redis_repository.dart';

class ConnectionsWidget extends StatefulWidget {
  const ConnectionsWidget({Key? key}) : super(key: key);

  @override
  State<ConnectionsWidget> createState() => _ConnectionsWidgetState();
}

class _ConnectionsWidgetState extends State<ConnectionsWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    ConnectionList connection = Provider.of<ConnectionList>(context);

    return ListView.builder(
      itemCount: connection.totalConnections,
      itemBuilder: (ctx, index) {
        late Connection conn = connection.connections[index];
        return Card(
          child: Column(
            children: [
              ListTile(
                title: Text('${conn.host}:${conn.port}'),
                subtitle: Text('teste'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_right_alt),
                  onPressed: () {
                    RedisRepository(conn).getKeys;
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
