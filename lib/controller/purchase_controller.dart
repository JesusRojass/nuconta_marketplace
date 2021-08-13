import 'dart:convert';

import 'package:graphql/client.dart';
import 'dart:async';
import 'package:nuconta_marketplace/config/queries.dart';
import 'package:nuconta_marketplace/model/purchase_data.dart';
import 'package:nuconta_marketplace/utils/json_utils.dart';

Future<PurchaseData> commitPurchase(
    GraphQLClient _client, String _offerId) async {
  //Initialize Mutation Options
  final MutationOptions purchaseOptions = MutationOptions(
    document: gql(Queries.buyProduct),
    variables: <String, dynamic>{
      'offerId': _offerId,
    },
  );

  final QueryResult result = await _client.mutate(purchaseOptions);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    final purchaseRes =
        getPrettyJSONString(result.data!['purchase'].cast<String, dynamic>());
    print(purchaseRes);
    return PurchaseData.fromJson(jsonDecode(purchaseRes));
  }
}
