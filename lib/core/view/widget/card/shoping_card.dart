import 'package:flutter/material.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShoppingCard extends StatelessWidget {
  final Product product;
  final EdgeInsets padding;
  final double radius;

  const ShoppingCard({Key key, this.product, this.padding, this.radius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    return Card(
      child: Padding(
        padding: padding ?? EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildExpandedImage(),
            buildText(currentTheme),
            SizedBox(height: height * 0.01),
            buildTitleText(currentTheme),
            SizedBox(height: height * 0.005),
            buildWeightText(currentTheme)
          ],
        ),
      ),
    );
  }

  Text buildWeightText(ThemeData currentTheme) {
    return Text(
      "${product.weight}g",
      style: currentTheme.textTheme.headline6
          .copyWith(fontWeight: FontWeight.w300),
    );
  }

  Text buildTitleText(ThemeData currentTheme) {
    return Text(
      product.title,
      maxLines: 2,
      style: currentTheme.textTheme.headline6,
    );
  }

  Text buildText(ThemeData currentTheme) {
    return Text(
      "\$ ${product.price}",
      style: currentTheme.textTheme.headline4
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Expanded buildExpandedImage() {
    return Expanded(
      child: Center(
        child: AspectRatio(
            aspectRatio: 1 / 3, child: Image.network(product.image)),
      ),
    );
  }
}
