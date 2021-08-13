class Queries {
  static String userData = r'''
  {
    viewer{
      id
      name
      balance
    }
  }
  ''';

  static String getProducts = r'''
  {
    viewer{
      offers {
        id
        product{
          id
          image
          name
          description
        }
        price
      }
    }
  }
  ''';

  static String buyProduct = r'''
  mutation CreateReviewForEpisode($offerId: ID!) {
    purchase(offerId: $offerId){
      success
      errorMessage
      customer {
        id
        name
        balance
      }
    }
  }
  ''';
}
