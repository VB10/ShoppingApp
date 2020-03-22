import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';

import '../../../../features/shop/model/product.dart';

class ShoppingCardCircle extends StatelessWidget {
  const ShoppingCardCircle({
    Key key,
    @required this.currentTheme,
    @required this.product,
    this.index,
  }) : super(key: key);

  final ThemeData currentTheme;
  final Product product;
  final int index;

  Widget get badge => Visibility(
        visible: product.count != 0,
        child: Positioned(
          top: 0,
          right: 0,
          height: 14,
          width: 14,
          child: CircleAvatar(
            backgroundColor: currentTheme.errorColor,
            child: Text(
              product.count.toString(),
              style: currentTheme.textTheme.headline6
                  .copyWith(color: currentTheme.canvasColor),
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Hero(
        tag: AppStrings.instance.subHeroTag(index),
        child: Column(
          children: <Widget>[
            Spacer(),
            Stack(children: <Widget>[buildCircleImageAvatar(), badge]),
            Spacer(),
          ],
        ),
      ),
    );
  }

  CircleAvatar buildCircleImageAvatar() {
    return CircleAvatar(
      backgroundColor: currentTheme.canvasColor,
      child: Image.network(
        product.image,
        height: 20,
        width: 20,
      ),
    );
  }
}
