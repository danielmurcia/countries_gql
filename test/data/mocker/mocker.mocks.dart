// Mocks generated by Mockito 5.0.15 from annotations
// in countries_gql/test/data/mocker/mocker.dart.
// Do not manually edit this file.

import 'package:countries_gql/data/gql/gql_client.dart' as _i3;
import 'package:graphql/client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeGraphQLClient_0 extends _i1.Fake implements _i2.GraphQLClient {}

/// A class which mocks [GqlClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockGqlClient extends _i1.Mock implements _i3.GqlClient {
  MockGqlClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GraphQLClient get client =>
      (super.noSuchMethod(Invocation.getter(#client),
          returnValue: _FakeGraphQLClient_0()) as _i2.GraphQLClient);
  @override
  String toString() => super.toString();
}
