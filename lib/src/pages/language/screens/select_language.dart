import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/providers/locale_provider.dart';
import 'package:tkween/src/widgets/custom_elevated_button.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    Text _title(String val) {
      switch (val) {
        case 'en':
          return Text('English', style: theme.textTheme.bodyText2);
        case 'id':
          return Text('Bahasa Indonesia', style: theme.textTheme.bodyText2);
        case 'hi':
          return Text('भारतीय भाषाएं', style: theme.textTheme.bodyText2);
        case 'ar':
          return Text('عربي', style: theme.textTheme.bodyText2);
        default:
          return Text('English', style: theme.textTheme.bodyText2);
      }
    }
    return Consumer<LocaleProvider>(builder: (context, locale, snapshot) {
      final lang = locale.locale ?? Localizations.localeOf(context);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: Text('Select Language',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16),),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Const.space8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: CustomElevatedButton(
                    label: 'English',
                    onTap: () {
                      locale.setLocale(Locale('en'));
                      Get.toNamed(Routes.onBoarding);
                    },
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 150,
                  child: CustomElevatedButton(
                    label:'عربي',
                    onTap: () {
                      locale.setLocale(Locale('ar'));
                      Get.toNamed(Routes.signIn);
                    },
                  ),
                ),

              ],),
          ),
        ),
      );
    });

  }

}
