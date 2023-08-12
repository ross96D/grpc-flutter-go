import 'package:frontend/src/generated/user.pbgrpc.dart';
import 'package:grpc/grpc.dart';

abstract class Connection {
  static ClientChannel channel = ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure()
    )
  );
}

abstract class Authorization {
  static Token? token;
  static MapEntry<String, String> get getAuth {
    return MapEntry('authorization', 'Bearer ${token!.token}');
  }
}