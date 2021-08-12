import 'package:graphql/client.dart';
import 'dart:async';
import 'package:nuconta_marketplace/config/queries.dart';

final QueryOptions options = QueryOptions(document: gql(Queries.userData));

Future<void> fetchUserData(GraphQLClient _client) async {
  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    print(result.exception.toString());
  }
  print(result.data!['viewer']['name']);
}
