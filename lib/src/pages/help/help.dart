import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/widgets/custom_app_bar.dart';
import 'package:tkween/src/widgets/empty_section.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        await Get.offAllNamed<dynamic>(Routes.profile);
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          leadingOntap: () => Get.offAllNamed<dynamic>(Routes.profile),
          title: 'Help',
          actions: [
            IconButton(
              onPressed: () => Get.toNamed<dynamic>(Routes.search),
              icon: const Icon(FeatherIcons.search),
            ),
          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              title: AutoSizeText(AppLocalizations.of(context)!.privacy_policy,
                  style: theme.textTheme.headline3),
              trailing: Icon(FeatherIcons.chevronRight,
                  size: 16, color: theme.hintColor),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              title: AutoSizeText(AppLocalizations.of(context)!.about_us,
                  style: theme.textTheme.headline3),
              trailing: Icon(FeatherIcons.chevronRight,
                  size: 16, color: theme.hintColor),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              title: AutoSizeText(AppLocalizations.of(context)!.contact_us,
                  style: theme.textTheme.headline3),
              trailing: Icon(FeatherIcons.chevronRight,
                  size: 16, color: theme.hintColor),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => Get.toNamed<dynamic>(Routes.chat),
              title: AutoSizeText(AppLocalizations.of(context)!.chat_with_us,
                  style: theme.textTheme.headline3),
              trailing: Icon(FeatherIcons.chevronRight,
                  size: 16, color: theme.hintColor),
            ),
          ],),
        )
      ),
    );
  }
}
