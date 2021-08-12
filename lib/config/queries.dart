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
        product{
          image
          name
        }
        price
      }
    }
  }
  ''';
}
