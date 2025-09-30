import 'package:eventlyapp/ui/CreateEvent/CreateEvent.dart';
import 'package:eventlyapp/ui/OnBoardingPage.dart';
import 'package:eventlyapp/ui/home/HomeScreen.dart';
import 'package:eventlyapp/ui/home/HomeTab.dart';
import 'package:eventlyapp/ui/login/CreateAccountPage.dart';
import 'package:eventlyapp/ui/login/LogInPage.dart';
import 'package:eventlyapp/ui/login/ResetPassword.dart';
import 'package:eventlyapp/utils/AppRouteNames.dart';
import 'package:eventlyapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Providers/app_langeuge_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Applanguegeprovider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languegeprovider = Provider.of<Applanguegeprovider>(context);
    return MaterialApp(
      locale:Locale(languegeprovider.appLanguege),
      localizationsDelegates:AppLocalizations.localizationsDelegates ,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: Approutenames.OnBoardingScreenRoutename,
        routes: {
          Approutenames.HomeScreenRoutename: (context) => Homescreen(),
          Approutenames.OnBoardingScreenRoutename: (context) =>
              OnBoardingPage(),
          Approutenames.loginRoutename: (context) => Loginpage(),
          Approutenames.createaccRoutename: (context) => Createaccountpage(),
          Approutenames.ResetPassRoutename: (context) => Resetpassword(),
          Approutenames.HomeTab: (context) => Hometab(),
          Approutenames.createevent: (context) => Createevent(),

        }
    );
  }
}
