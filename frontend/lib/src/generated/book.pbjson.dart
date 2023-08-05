///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use bookDescriptor instead')
const Book$json = const {
  '1': 'Book',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'author', '3': 2, '4': 1, '5': 11, '6': '.Author', '10': 'author'},
    const {'1': 'price', '3': 3, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'cover_url', '3': 4, '4': 1, '5': 9, '10': 'coverUrl'},
    const {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'date_out', '3': 7, '4': 1, '5': 3, '10': 'dateOut'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode('CgRCb29rEg4KAmlkGAEgASgFUgJpZBIfCgZhdXRob3IYAiABKAsyBy5BdXRob3JSBmF1dGhvchIUCgVwcmljZRgDIAEoAlIFcHJpY2USGwoJY292ZXJfdXJsGAQgASgJUghjb3ZlclVybBIUCgV0aXRsZRgFIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBiABKAlSC2Rlc2NyaXB0aW9uEhkKCGRhdGVfb3V0GAcgASgDUgdkYXRlT3V0');
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
