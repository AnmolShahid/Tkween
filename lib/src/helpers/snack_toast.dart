import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tkween/src/helpers/colors.dart';

Widget toast = Container(
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.greenAccent,
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.check),
      SizedBox(
        width: 12.0,
      ),
      Text("This is a Custom Toast"),
    ],
  ),
);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(
    {context, required String msg, Color? backgroundColor, Color? textColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}

SnackbarController showSnackbar(
  BuildContext context, {
  required String title,
  required String subtitle,
  SnackPosition position = SnackPosition.BOTTOM,
}) {
  final theme = Theme.of(context);
  return Get.snackbar(
    '',
    '',
    titleText: Text(title, style: theme.textTheme.headline4),
    messageText: Text(subtitle, style: theme.textTheme.subtitle2),
    forwardAnimationCurve: Curves.easeInBack,
    backgroundColor: theme.cardColor,
    icon: const Icon(FeatherIcons.checkCircle),
    snackPosition: position,
  );
}
