import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/view/base/base_state.dart';
import '../../../core/view/widget/card/shop_payment_card.dart';
import '../../../core/view/widget/listTile/payment_list_tile.dart';
import '../model/product.dart';

class ShopPaymentView extends StatefulWidget {
  @override
  _ShopPaymentViewState createState() => _ShopPaymentViewState();
}

class _ShopPaymentViewState extends BaseState<ShopPaymentView> {
  List<Product> _dummyList;

  @override
  void initState() {
    super.initState();
    _dummyList = dummyList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Expanded(
          child: Text(AppStrings.instance.paymentTitle,
              style: currentTheme.primaryTextTheme.headline1),
        ),
        Expanded(
          child: ShopPaymentCard(item: _dummyList.first),
        ),
        Expanded(
          child: PaymentListTile(
            totalMoney: 30,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
