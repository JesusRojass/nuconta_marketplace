import 'package:graphql/client.dart';
import 'dart:async';
import 'package:nuconta_marketplace/config/queries.dart';
import 'package:nuconta_marketplace/utils/json_utils.dart';

Future<void> commitPurchase(GraphQLClient _client, String _offerId) async {
  //Initialize Mutation Options
  final MutationOptions purchaseOptions = MutationOptions(
    document: gql(Queries.buyProduct),
    variables: <String, dynamic>{
      'offerId': _offerId,
    },
  );

  final QueryResult result = await _client.mutate(purchaseOptions);

  if (result.hasException) {
    print(result.exception.toString());
  } else {
    final purchaseRes =
        getPrettyJSONString(result.data!['purchase'].cast<String, dynamic>());
    print(purchaseRes);
  }
}
