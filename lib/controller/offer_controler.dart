import 'dart:convert';
import 'package:graphql/client.dart';
import 'dart:async';
import 'package:nuconta_marketplace/config/queries.dart';
import 'package:nuconta_marketplace/model/offer_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/json_utils.dart';

final QueryOptions options = QueryOptions(document: gql(Queries.getProducts));

Future<RootOfferTree> fetchOfferData(GraphQLClient _client) async {
  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    final offerResponse =
        getPrettyJSONString(result.data!['viewer'].cast<String, dynamic>());
    return RootOfferTree.fromJson(jsonDecode(offerResponse));
  }
}
