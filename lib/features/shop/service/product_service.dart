import 'package:shoppingapp/features/shop/model/product.dart';

class ShopService {
  Future fetchAllProduct() async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(dummyList);
  }
}
