import 'package:redis/redis.dart';
import 'package:redismanager/models/connection.dart';

class RedisRepository {
  final Connection connectionString;
  RedisRepository(this.connectionString);

  Future<void> get getKeys {
    return RedisConnection()
        .connect(connectionString.host, connectionString.port)
        .then((command) {
      command.send_object(["keys", "*"]).then((value) => print(value));
    });
  }
}
