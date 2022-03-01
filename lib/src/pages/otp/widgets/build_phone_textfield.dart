part of '../otp_page.dart';

class _BuildPhoneTextField extends StatelessWidget {
  const _BuildPhoneTextField({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1000),
      child: CustomTextFormField(
        controller: phoneController,
        textFieldType: TextFieldType.phoneNumber,
        borderType: BorderType.outline,
        hintText: AppLocalizations.of(context)!.phone_number,
        prefixIcon: Icon(
          FeatherIcons.phone,
          color: _theme.primaryColor,
        ),
      ),
    );
  }
}
