import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_state.dart';
import 'package:shoppingapp/core/view/widget/card/shoping_card.dart';
import 'package:shoppingapp/features/shop/model/product.dart';
import 'package:shoppingapp/features/shop/view/shop_view_detail.dart';

part './shop_animation.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends BaseState<ShopView> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  List<Product> subList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[buildSliverAppBar(), buildSliverProductGrid()],
      ),
    );
  }

  Widget buildSliverProductGrid() {
    return SliverPadding(
      padding: insetsAll(0.02),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 10.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final product = dummyList[index];
            return AspectRatio(
              aspectRatio: 10 / 10,
              child: _OpenContainerWrapper(
                transitionType: _transitionType,
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return InkWell(
                      onTap: openContainer,
                      child: ShoppingCard(product: product));
                },
              ),
            );
          },
          childCount: dummyList.length,
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: dynamicHeight(0.2),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(appConstants.shopConstants.title),
        centerTitle: false,
        titlePadding: EdgeInsets.zero,
      ),
    );
  }
}
