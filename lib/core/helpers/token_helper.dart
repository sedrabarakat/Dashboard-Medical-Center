import '../data/datasources/local.dart';

class TokenHelper{
  static bool hasToken = false;
  static Future<void> init() async {
    String? token = await SharedPrefrence.getData(key:'token');
    hasToken = token != null;
  }
}