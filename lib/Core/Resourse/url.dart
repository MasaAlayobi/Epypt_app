

abstract class Url{
  static String url='https://backend.almowafraty.com/api/v1/';
 
}
abstract class EndPoint{
 static String register='suppliers/register';
 static String login ='suppliers/login';
 static String getProducts='products';
 static String getAvailableProduct='available/1';
 static String getNotAvailableProduct='available/0';
 static String addProductWithoutOffer='suppliers';
 static String addProductWithOffer='suppliers';
 static String addOffer='offer/';
 static String updateOffer='update/';
 static String addAvailableOrNot='is_available/';
 static String getCities='categories';
 static String refreshToken='suppliers/refresh-token';
 static String deleteProduct='suppliers/';
 static String updatePrice="update/";
 static String CategoriesSupplier="categories";
 static String logout='suppliers/logout';
 static String Notification='notification';
}