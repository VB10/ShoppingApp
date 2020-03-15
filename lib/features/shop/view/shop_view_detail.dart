import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShopDetailView extends StatelessWidget {
  final Product data;
  final int index;

  const ShopDetailView({Key key, this.data, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: AppStrings.instance.listHeroTag(index),
              child:
                  AspectRatio(aspectRatio: 1, child: Image.network(data.image)),
            ),
            Hero(
              tag: AppStrings.instance.subHeroTag(index),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
