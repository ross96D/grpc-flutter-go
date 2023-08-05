///
//  Generated code. Do not modify.
//  source: usuario.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'usuario.pb.dart' as $1;
export 'usuario.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$1.LoginParams, $1.User>(
      '/UserService/Login',
      ($1.LoginParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.User.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.User> login($1.LoginParams request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.LoginParams, $1.User>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginParams.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
  }

  $async.Future<$1.User> login_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LoginParams> request) async {
    return login(call, await request);
  }

  $async.Future<$1.User> login($grpc.ServiceCall call, $1.LoginParams request);
}
