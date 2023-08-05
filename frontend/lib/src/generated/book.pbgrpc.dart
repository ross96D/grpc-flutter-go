///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'book.pb.dart' as $0;
export 'book.pb.dart';

class BookServiceClient extends $grpc.Client {
  static final _$getAllBooks =
      $grpc.ClientMethod<$0.GetAllBooksParams, $0.Book>(
          '/BookService/GetAllBooks',
          ($0.GetAllBooksParams value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$getBook = $grpc.ClientMethod<$0.GetBookParams, $0.Book>(
      '/BookService/GetBook',
      ($0.GetBookParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$searchBooks =
      $grpc.ClientMethod<$0.SearchBooksParams, $0.Book>(
          '/BookService/SearchBooks',
          ($0.SearchBooksParams value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Book.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Book> getAllBooks($0.GetAllBooksParams request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllBooks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Book> getBook($0.GetBookParams request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBook, request, options: options);
  }

  $grpc.ResponseStream<$0.Book> searchBooks($0.SearchBooksParams request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$searchBooks, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetAllBooksParams, $0.Book>(
        'GetAllBooks',
        getAllBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetAllBooksParams.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBookParams, $0.Book>(
        'GetBook',
        getBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBookParams.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchBooksParams, $0.Book>(
        'SearchBooks',
        searchBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SearchBooksParams.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Book> getAllBooks_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetAllBooksParams> request) async* {
    yield* getAllBooks(call, await request);
  }

  $async.Future<$0.Book> getBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBookParams> request) async {
    return getBook(call, await request);
  }

  $async.Stream<$0.Book> searchBooks_Pre($grpc.ServiceCall call,
      $async.Future<$0.SearchBooksParams> request) async* {
    yield* searchBooks(call, await request);
  }

  $async.Stream<$0.Book> getAllBooks(
      $grpc.ServiceCall call, $0.GetAllBooksParams request);
  $async.Future<$0.Book> getBook(
      $grpc.ServiceCall call, $0.GetBookParams request);
  $async.Stream<$0.Book> searchBooks(
      $grpc.ServiceCall call, $0.SearchBooksParams request);
}
