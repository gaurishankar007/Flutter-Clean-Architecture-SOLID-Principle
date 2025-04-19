part of 'generic_bottom_sheet.dart';

class BottomSheetTitleWidget extends StatelessWidget {
  final String title;
  const BottomSheetTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenUtil.I.pagePadding().copyWith(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: TitleWidget(title: title)),
          IconButtonWidget(
            onPressed: NavigationUtil.I.popPage,
            disableSplash: true,
            icon: const Icon(
              AppIcon.close,
              size: 20,
              color: AppColor.black,
            ),
          )
        ],
      ),
    );
  }
}
