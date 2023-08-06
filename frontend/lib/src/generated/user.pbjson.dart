///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.Book', '10': 'books'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEhsKBWJvb2tzGAEgAygLMgUuQm9va1IFYm9va3MSDgoCaWQYAiABKAVSAmlkEhIKBG5hbWUYAyABKAlSBG5hbWUSGgoIbGFzdG5hbWUYBCABKAlSCGxhc3RuYW1lEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcmQ=');
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
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode('CgVUb2tlbhIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use registerResultDescriptor instead')
const RegisterResult$json = const {
  '1': 'RegisterResult',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
  ],
};

/// Descriptor for `RegisterResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResultDescriptor = $convert.base64Decode('Cg5SZWdpc3RlclJlc3VsdBIWCgZyZXN1bHQYASABKAhSBnJlc3VsdA==');
