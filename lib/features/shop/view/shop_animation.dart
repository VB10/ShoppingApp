part of 'shop_view.dart';

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.closedBuilder2,
  });

  final OpenContainerBuilder closedBuilder;
  final Widget closedBuilder2;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return ShopDetailView();
      },
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
