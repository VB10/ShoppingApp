part of 'shop_view.dart';

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onOpenCardClose,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final Function(dynamic data) onOpenCardClose;

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
