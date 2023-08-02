///
//  Generated code. Do not modify.
//  source: protos/usuario.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use usuarioDescriptor instead')
const Usuario$json = const {
  '1': 'Usuario',
  '2': const [
    const {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.Book', '10': 'books'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `Usuario`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usuarioDescriptor = $convert.base64Decode('CgdVc3VhcmlvEhsKBWJvb2tzGAEgAygLMgUuQm9va1IFYm9va3MSDgoCaWQYAiABKAVSAmlkEhIKBG5hbWUYAyABKAlSBG5hbWUSGgoIbGFzdG5hbWUYBCABKAlSCGxhc3RuYW1lEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use bookDescriptor instead')
const Book$json = const {
  '1': 'Book',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'author', '3': 2, '4': 1, '5': 9, '10': 'author'},
    const {'1': 'cover_url', '3': 3, '4': 1, '5': 9, '10': 'coverUrl'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode('CgRCb29rEg4KAmlkGAEgASgFUgJpZBIWCgZhdXRob3IYAiABKAlSBmF1dGhvchIbCgljb3Zlcl91cmwYAyABKAlSCGNvdmVyVXJs');
@$core.Deprecated('Use getAllBooksParamsDescriptor instead')
const GetAllBooksParams$json = const {
  '1': 'GetAllBooksParams',
};

/// Descriptor for `GetAllBooksParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllBooksParamsDescriptor = $convert.base64Decode('ChFHZXRBbGxCb29rc1BhcmFtcw==');
@$core.Deprecated('Use getBookParamsDescriptor instead')
const GetBookParams$json = const {
  '1': 'GetBookParams',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetBookParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBookParamsDescriptor = $convert.base64Decode('Cg1HZXRCb29rUGFyYW1zEg4KAmlkGAEgASgFUgJpZA==');
@$core.Deprecated('Use searchBooksParamsDescriptor instead')
const SearchBooksParams$json = const {
  '1': 'SearchBooksParams',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'author', '3': 2, '4': 1, '5': 9, '10': 'author'},
  ],
};

/// Descriptor for `SearchBooksParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchBooksParamsDescriptor = $convert.base64Decode('ChFTZWFyY2hCb29rc1BhcmFtcxIOCgJpZBgBIAEoBVICaWQSFgoGYXV0aG9yGAIgASgJUgZhdXRob3I=');
@$core.Deprecated('Use loginParamsDescriptor instead')
const LoginParams$json = const {
  '1': 'LoginParams',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginParamsDescriptor = $convert.base64Decode('CgtMb2dpblBhcmFtcxIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSFAoFZW1haWwYAiABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZA==');
