import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/helpers/dialogs.dart';
import 'package:tkween/src/pages/help/help.dart';
import 'package:tkween/src/providers/theme_provider.dart';

import '../providers/locale_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<LocaleProvider>(builder: (context, locale, snapshot) {
      final lang = locale.locale?.languageCode;
      return Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.all(0),
          children: [

            if(lang=='ar')...[
              Container(
                color: theme.primaryColor,
                width: double.infinity,

                height: 80,
                child: Text('    Hello guest',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              arbWidget(theme, themeProvider)
            ]else...[
              Container(
                padding:EdgeInsets.only(top: 8),
                alignment: Alignment.centerLeft,
                color: theme.primaryColor,
                width: double.infinity,
                height: 80,
                child: Text('    Hello guest',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              SizedBox(height:8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.profileDetail),
                    leading: Icon(FeatherIcons.user, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.detail_profile,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.favorite),
                    leading: Icon(FeatherIcons.heart, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.favorite,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.order),
                    leading: Icon(FeatherIcons.truck, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.my_orders,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.wallet),
                    leading: Icon(FeatherIcons.creditCard, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.wallet,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.coupon),
                    leading: Icon(FeatherIcons.gift, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.my_coupon,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: Icon(FeatherIcons.sun, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.light_mode,
                        style: theme.textTheme.headline3),
                    trailing: Switch(
                      value: themeProvider.isLightTheme,
                      activeColor: theme.primaryColor,
                      onChanged: (v) => themeProvider.changeTheme(),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Get.toNamed<dynamic>(Routes.language),
                    leading: Icon(FeatherIcons.globe, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.change_language,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Get.to(Help());
                    },
                    leading: Icon(FeatherIcons.helpCircle, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.help,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,                  size: 16, color: theme.hintColor),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Dialogs.showDialogWithLabel(context,
                        title: AppLocalizations.of(context)!.are_you_sure_want_to_quit,
                        labelButton: AppLocalizations.of(context)!.exit,
                        onTapButton: () => Get.offAllNamed<dynamic>(Routes.splash)),
                    leading: Icon(FeatherIcons.logOut, color: theme.hintColor),
                    title: AutoSizeText(AppLocalizations.of(context)!.log_out,
                        style: theme.textTheme.headline3),
                    trailing: Icon(FeatherIcons.chevronRight,
                        size: 16, color: theme.hintColor),
                  ),
                ],),
              )
            ],

          ],
        ),
      );
    });

  }
  arbWidget(theme,themeProvider){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(children: [

        SizedBox(height:8,),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.profileDetail),
          trailing: Icon(FeatherIcons.user, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.detail_profile,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.favorite),
          trailing: Icon(FeatherIcons.heart, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.favorite,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.order),
          trailing: Icon(FeatherIcons.truck, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.my_orders,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.wallet),
          trailing: Icon(FeatherIcons.creditCard, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.wallet,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.coupon),
          trailing: Icon(FeatherIcons.gift, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.my_coupon,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          trailing: Icon(FeatherIcons.sun, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.light_mode,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Switch(
            value: themeProvider.isLightTheme,
            activeColor: theme.primaryColor,
            onChanged: (v) => themeProvider.changeTheme(),
          ),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => Get.toNamed<dynamic>(Routes.language),
          trailing: Icon(FeatherIcons.globe, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.change_language,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),

        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            Get.to(Help());
          },

          trailing: Icon(FeatherIcons.helpCircle, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.help,
              textAlign: TextAlign.right,
              style: theme.textTheme.headline3),
          leading: Icon(FeatherIcons.chevronLeft,                  size: 16, color: theme.hintColor),
        ),

        ListTile(

          contentPadding: EdgeInsets.zero,
          onTap: () => Dialogs.showDialogWithLabel(context,
              title: AppLocalizations.of(context)!.are_you_sure_want_to_quit,
              labelButton: AppLocalizations.of(context)!.exit,
              onTapButton: () => Get.offAllNamed<dynamic>(Routes.splash)),
          trailing: Icon(FeatherIcons.logOut, color: theme.hintColor),
          title: AutoSizeText(AppLocalizations.of(context)!.log_out,
              style: theme.textTheme.headline3,
            textAlign: TextAlign.right,
          ),
          leading: Icon(FeatherIcons.chevronLeft,
              size: 16, color: theme.hintColor),
        ),
      ],),
   );
  }
}
