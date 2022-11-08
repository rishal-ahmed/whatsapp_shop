import 'package:whatsapp_shop/core/constants/base_url.dart';

class ApiEndpoints {
  static const String login = '${baseUrl}customer/login';
  static const String register = '${baseUrl}customer/register';
  static const String home = '${baseUrl}home';
  static const String searchHome = '${baseUrl}searchhome';
  static const String shopHome = '${baseUrl}shophome';
  static const String productCategories = '${baseUrl}shops/categories';
  static const String products = '${baseUrl}products';
  static const String searchProducts = '${baseUrl}searchshophome';
  static const String product = '${baseUrl}product/';
}
