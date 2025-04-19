part of 'generic_bottom_sheet.dart';

class BottomSheetContainerWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderWidth;
  final Widget child;

  const BottomSheetContainerWidget({
    super.key,
    this.padding,
    this.margin,
    this.borderWidth = 1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: margin,
      padding: padding ?? ScreenUtil.I.pagePadding().copyWith(top: 12),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColor.black10,
            width: borderWidth,
          ),
        ),
      ),
      child: child,
    );
  }
}
