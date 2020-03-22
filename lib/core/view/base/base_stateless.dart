import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  double dynamicHeight({@required BuildContext context, @required double val}) {
    return MediaQuery.of(context).size.height * val;
  }

  double dynamicWidth({@required BuildContext context, @required double val}) {
    return MediaQuery.of(context).size.width * val;
  }

  TextTheme currentTheme(BuildContext context) => Theme.of(context).textTheme;
  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
}
