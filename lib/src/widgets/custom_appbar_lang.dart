import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/pages/home/home_page.dart';

import 'package:tkween/src/providers/locale_provider.dart';
// ignore: non_constant_identifier_names
AppBar CustomAppBarLang(
  BuildContext context, {
  String? title,
  bool centerTitle = true,
  bool enableLeading = true,
  List<Widget>? actions,
  void Function()? leadingOntap,
  PreferredSizeWidget? bottom,
  Color? backgroundColor,
  Color? leadingIconColor,
}) {
  final theme = Theme.of(context);
  return AppBar(
    backgroundColor:
        (backgroundColor == null) ? theme.backgroundColor : backgroundColor,
    centerTitle: centerTitle,
    leading: enableLeading
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (leadingOntap == null) ? buildBackOnTap : leadingOntap,
            color: leadingIconColor ?? theme.primaryColor,
          )
        : const SizedBox(),
    title: Text(title ?? '', style: theme.textTheme.headline3),
    actions: actions,
    bottom: bottom,
  );
}

void buildBackOnTap() {
  
    Get.offAllNamed<dynamic>(Routes.home);
}
