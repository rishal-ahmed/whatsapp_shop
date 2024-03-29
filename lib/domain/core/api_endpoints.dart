import 'package:whatsapp_shop/core/constants/base_url.dart';

class ApiEndpoints {
  //==================== Authentications ====================
  static const String login = '${baseUrl}customer/login';
  static const String register = '${baseUrl}customer/register';

  //==================== Home ====================
  static const String home = '${baseUrl}home';
  static const String searchHome = '${baseUrl}searchhome';

  //==================== Shop ====================
  static const String shopHome = '${baseUrl}shophome';
  static const String productCategories = '${baseUrl}shops/categories';

  //==================== Prodct ====================
  static const String products = '${baseUrl}products';
  static const String searchProducts = '${baseUrl}searchshophome';
  static const String product = '${baseUrl}product/';

  //==================== Cart ====================
  static const String cartAdd = '${baseUrl}addtocart';
  static const String carts = '${baseUrl}getcart';
  static const String cartCount = '${baseUrl}cartcount';
  static const String cartSumTotal = '${baseUrl}getcartsumtotal';
  static const String cartRemove = '${baseUrl}removecart';
  static const String cartChangeQuantity = '${baseUrl}changequantity';
  static const String cartClear = '${baseUrl}clearcart';

  //==================== Address ====================
  static const String addressAdd = '${baseUrl}address/create';
  static const String addresses = '${baseUrl}address';
  static const String address = '${baseUrl}address/';
  static const String addressRemove = '${baseUrl}address/remove/';
  static const String addressDefault = '${baseUrl}address/default';
  static const String addressUpdate = '${baseUrl}address/update/';

  //==================== Order ====================
  static const String order = '${baseUrl}placeorder';
  static const String orders = '${baseUrl}orders';
}
