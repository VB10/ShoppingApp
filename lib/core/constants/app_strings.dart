part 'inapp/shop_strings.dart';

class AppConstants {
  static AppConstants _instance = AppConstants._init();
  static AppConstants get instance => _instance;
  AppConstants._init();

  final shopConstants = _ShopStrings();
}
