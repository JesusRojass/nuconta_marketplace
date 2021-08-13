import 'dart:convert';
import 'package:graphql/client.dart';
import 'dart:async';
import 'package:nuconta_marketplace/config/queries.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/json_utils.dart';

final QueryOptions options = QueryOptions(document: gql(Queries.userData));

Future<User> fetchUserData(GraphQLClient _client) async {
  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    final userResponse =
        getPrettyJSONString(result.data!['viewer'].cast<String, dynamic>());
    // print(userResponse);
    return User.fromJson(jsonDecode(userResponse));
  }
}
