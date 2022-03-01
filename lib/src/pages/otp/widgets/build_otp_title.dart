part of '../otp_page.dart';

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
              children: [
                Text('Verification Code'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Enter 6 digit Code received by SMS',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            );
  }
}
