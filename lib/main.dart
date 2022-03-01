// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tkween/l10n/l10n.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/helpers/routes.dart';
import 'package:tkween/src/helpers/themes.dart';
import 'package:tkween/src/providers/authentication_provider.dart';
import 'package:tkween/src/providers/cart_provider.dart';
import 'package:tkween/src/providers/checkout_provider.dart';
import 'package:tkween/src/providers/locale_provider.dart';
import 'package:tkween/src/providers/product_provider.dart';
import 'package:tkween/src/providers/search_provider.dart';
import 'package:tkween/src/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, theme, locale, snapshot) {
          return GetMaterialApp(
            title: 'Tkween',
            debugShowCheckedModeBanner: false,
            locale: locale.locale,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                (theme.isLightTheme == true) ? ThemeMode.light : ThemeMode.dark,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: Routes.splash,
            supportedLocales: L10n.all,
            getPages: allRoutes,
          );
        },
      ),
    );
  }
}
