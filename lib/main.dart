import 'package:flutter/material.dart';
import 'package:shoppingapp/features/shop/view/shop_view.dart';

import 'core/view/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ShopView(),
    );
  }
}
