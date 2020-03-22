import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingapp/core/constants/app_constants.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';
import 'package:shoppingapp/core/view/widget/container/empty_widget.dart';

class PaymentListTile extends StatelessWidget {
  final int totalMoney;

  const PaymentListTile({Key key, @required this.totalMoney}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildCarCircleAvatar(context),
      title: buildTextDelivery(context),
      trailing: buildTextMoney(context),
      subtitle: Row(
        children: <Widget>[
          Expanded(flex: 2, child: buildDeliveryBodyColumn(context)),
          Spacer(),
        ],
      ),
    );
  }

  Text buildTextMoney(BuildContext context) {
    return Text("\$$totalMoney",
        style: Theme.of(context)
            .primaryTextTheme
            .headline4
            .copyWith(color: Theme.of(context).splashColor));
  }

  Text buildTextDelivery(BuildContext context) {
    return Text(
      AppStrings.instance.delivery,
      style: Theme.of(context).primaryTextTheme.headline3,
    );
  }

  CircleAvatar buildCarCircleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).splashColor,
      child: Icon(
        FontAwesomeIcons.car,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Column buildDeliveryBodyColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Expanded(
          flex: 9,
          child: Text(
            AppStrings.instance.orderFree,
            style: Theme.of(context)
                .primaryTextTheme
                .headline5
                .copyWith(color: Theme.of(context).splashColor),
          ),
        ),
        LinearProgressIndicator(
          value: indicatorValue,
          backgroundColor: Theme.of(context).splashColor,
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorDark),
        ),
      ],
    );
  }

  double get indicatorValue => (totalMoney / AppConstants.FREE_DELIVERY_MONEY);
}