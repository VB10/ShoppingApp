import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../core/view/base/base_state.dart';
import '../../../core/view/widget/avatar/number_circle_avatar.dart';
import '../../../core/view/widget/card/shoping_card.dart';
import '../model/product.dart';
import 'shop_view_detail.dart';

part './shop_animation.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends BaseState<ShopView> {
  List<Product> subList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          buildExpandedBody(),
          buildSubListContainer(),
        ],
      ),
    );
  }

  /// 1
  Expanded buildExpandedBody() {
    return Expanded(
      child: Card(
        color: currentTheme.canvasColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              dynamicHeight(0.05),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: dynamicHeight(0.03)),
          child: CustomScrollView(
            slivers: <Widget>[buildSliverAppBar(), buildSliverProductGrid()],
          ),
        ),
      ),
    );
  }

  /// 1.1
  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: dynamicHeight(0.2),
      pinned: true,
      elevation: 0,
      backgroundColor: currentTheme.canvasColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          appStrings.shopConstants.title,
          style: currentTheme.textTheme.headline3
              .copyWith(color: currentTheme.primaryColor),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 10),
      ),
    );
  }

  /// 1.2
  Widget buildSliverProductGrid() {
    return SliverPadding(
      padding: insetsAll(0.02),
      sliver: SliverGrid(
        gridDelegate: appConstants.sliverGridDelegateWithFixedCrossAxisCount,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final product = dummyList[index];
            return InkWell(
              onTap: () async => productCardOnPressed(index, product),
              child: Hero(
                  tag: appStrings.listHeroTag(index),
                  child: ShoppingCard(product: product)),
            );
          },
          childCount: dummyList.length,
        ),
      ),
    );
  }

  Future<void> productCardOnPressed(int index, Product product) async {
    final data = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ShopDetailView(data: product, index: index),
    ));
    if (data == null) {
      return;
    } else {
      if (subList.contains((data))) {
      } else {
        subList.add(data);
      }
      setState(() {});
    }
  }

  Widget buildSubListContainer() {
    return AnimatedContainer(
      height: subList.length <= 0 ? 0 : dynamicHeight(0.1),
      decoration: BoxDecoration(color: currentTheme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: dynamicHeight(0.02)),
      duration: Duration(seconds: 1),
      child: Row(
        children: <Widget>[
          text,
          SizedBox(width: dynamicWidth(0.05)),
          buildExpandedProductList(),
          NumberCircleAvatar(index: subList.length)
        ],
      ),
    );
  }

  Widget get text => Text(appStrings.shopConstants.subTitle,
      style: currentTheme.textTheme.headline3.copyWith(color: Colors.white));

  Expanded buildExpandedProductList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: subList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Hero(
            tag: appStrings.subHeroTag(index),
            child: CircleAvatar(
              backgroundColor: currentTheme.canvasColor,
              child: Padding(
                padding: EdgeInsets.all(dynamicHeight(0.015)),
                child: Image.network(subList[index].image),
              ),
            ),
          );
        },
      ),
    );
  }
}
