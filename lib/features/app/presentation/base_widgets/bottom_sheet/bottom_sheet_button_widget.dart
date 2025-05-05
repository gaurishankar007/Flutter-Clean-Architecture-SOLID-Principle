part of 'generic_bottom_sheet.dart';

class BottomSheetButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool loadableButton;
  final bool outlined;
  final double? topPadding;
  final double? bottomPadding;

  const BottomSheetButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.loadableButton = true,
    this.outlined = false,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelpers.screenLR(top: topPadding, bottom: bottomPadding),
      child: outlined
          ? SecondaryButtonWidget(
              text: text,
              onTap: onTap,
              expandWidth: true,
              loadableButton: loadableButton,
            )
          : PrimaryButtonWidget(
              text: text,
              onTap: onTap,
              expandWidth: true,
              loadableButton: loadableButton,
            ),
    );
  }
}
