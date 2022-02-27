part of '../sign_up_page.dart';

class _BuildSocialButton extends StatelessWidget {
  const _BuildSocialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Const.space15),
        CustomShakeTransition(
          duration: const Duration(milliseconds: 800),
          child: CustomSocialButton(
            label: AppLocalizations.of(context)!.connect_with_google,
            onTap: () => showToast(
              msg: AppLocalizations.of(context)!.google_sign_in_clicked,
            ),
            icon: CustomIcon.google,
          ),
        ),
        const SizedBox(height: Const.space15),
      ],
    );
  }
}
