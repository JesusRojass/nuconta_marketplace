import 'package:graphql/client.dart';
import 'package:nuconta_marketplace/config/api_constants.dart';

Future<GraphQLClient> initializeGQL() async {
  final _httpLink = HttpLink(
    Constants.apiUrl,
  );

  final _authLink = AuthLink(
    getToken: () async => 'Bearer ' + Constants.tkn,
  );

  Link _link = _authLink.concat(_httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  return client;
}
