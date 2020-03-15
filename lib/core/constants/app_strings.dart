part 'inapp/shop_strings.dart';

class AppStrings {
  static AppStrings _instance = AppStrings._init();
  static AppStrings get instance => _instance;
  AppStrings._init();

  final shopConstants = _ShopStrings();

  String subHeroTag(int index) => "subhero-$index";
  String listHeroTag(int index) => "listHero-$index";
}