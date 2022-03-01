part of '../otp_page.dart';

class _BuildLogo extends StatelessWidget {
  const _BuildLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadeTransition(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        CustomIcon.logo,
        width: Screens.width(context) / 3,
        height: Screens.width(context) / 3,
      ),
    );
  }
}
