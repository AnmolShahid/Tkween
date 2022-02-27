part of '../sign_in_page.dart';

class _BuildSkipButton extends StatelessWidget {
  final String? route;

  const _BuildSkipButton({Key? key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        top: Const.space25,
        right: Const.space5,
        child: CustomFadeTransition(
          axis: Axis.horizontal,
          duration:const Duration(milliseconds: 200),
          child: CustomTextButton(
            label: AppLocalizations.of(context)!.skip,
            onTap: () => Get.toNamed<dynamic>(route!),
          ),
        ),
      );
  }
}
