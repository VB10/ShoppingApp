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
  int totalMoney = 0;

  @override
  void initState() {
    super.initState();
    _dummyList = dummyList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.08)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          cartTitle(),
          Spacer(),
          buildExpandedShopList(),
          buildDeliveryCard(),
          Spacer(),
          buildMoneyTotalCard(context),
          Spacer(),
          buildNextButton(context),
        ],
      ),
    );
  }

  SizedBox buildNextButton(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(1),
      height: dynamicHeight(0.07),
      child: RaisedButton(
          shape: StadiumBorder(),
          color: Theme.of(context).primaryColorDark,
          onPressed: () {},
          child: Text(AppStrings.instance.next,
              style: currentTheme.textTheme.headline3)),
    );
  }

  Row buildMoneyTotalCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppStrings.instance.total,
          style: Theme.of(context)
              .primaryTextTheme
              .headline2
              .copyWith(fontWeight: FontWeight.w200),
        ),
        Text(
          "\$$totalMoney",
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ],
    );
  }

  Expanded buildDeliveryCard() =>
      Expanded(flex: 1, child: PaymentListTile(totalMoney: 30));

  Expanded buildExpandedShopList() => Expanded(
      flex: 4,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            ShopPaymentCard(item: _dummyList.first),
      ));

  Text cartTitle() {
    return Text(
      AppStrings.instance.paymentTitle,
      style: currentTheme.primaryTextTheme.headline1,
      textScaleFactor: 1.5,
    );
  }
}
