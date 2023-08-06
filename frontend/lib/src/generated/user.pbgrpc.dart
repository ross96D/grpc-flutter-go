///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $1;
export 'user.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$1.LoginParams, $1.Token>(
      '/UserService/Login',
      ($1.LoginParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Token.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$1.User, $1.RegisterResult>(
      '/UserService/Register',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RegisterResult.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Token> login($1.LoginParams request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.RegisterResult> register($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.LoginParams, $1.Token>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginParams.fromBuffer(value),
        ($1.Token value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.User, $1.RegisterResult>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.RegisterResult value) => value.writeToBuffer()));
  }

  $async.Future<$1.Token> login_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LoginParams> request) async {
    return login(call, await request);
  }

  $async.Future<$1.RegisterResult> register_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return register(call, await request);
  }

  $async.Future<$1.Token> login($grpc.ServiceCall call, $1.LoginParams request);
  $async.Future<$1.RegisterResult> register(
      $grpc.ServiceCall call, $1.User request);
}
