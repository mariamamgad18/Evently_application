import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/ui/CreateEvent/CreateEvent.dart';
import 'package:eventlyapp/ui/OnBoardingPage.dart';
import 'package:eventlyapp/ui/home/HomeScreen.dart';
import 'package:eventlyapp/ui/home/HomeTab.dart';
import 'package:eventlyapp/ui/home/ProfileTab.dart';
import 'package:eventlyapp/ui/login/CreateAccountPage.dart';
import 'package:eventlyapp/ui/login/LogInPage.dart';
import 'package:eventlyapp/ui/login/ResetPassword.dart';
import 'package:eventlyapp/utils/AppRouteNames.dart';
import 'package:eventlyapp/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Providers/Event_List_Provider.dart';
import 'Providers/User_provider.dart';
import 'Providers/app_langeuge_provider.dart';
import 'Providers/app_theme_provider.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//await FirebaseFirestore.instance.disableNetwork();
  runApp( 
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => EventListProvider()),
        ChangeNotifierProvider(create: (context) => Applanguegeprovider()),
        ChangeNotifierProvider(create: (context) => Appthemeprovider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),

      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languegeprovider = Provider.of<Applanguegeprovider>(context);
    var themeprovider = Provider.of<Appthemeprovider>(context);
    var eventprovider = Provider.of<EventListProvider>(context);


    return MaterialApp(
      locale: Locale(languegeprovider.appLanguege),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeprovider.isLightTheme ? ThemeMode.light : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: Approutenames.OnBoardingScreenRoutename,
      routes: {
        Approutenames.HomeScreenRoutename: (context) => Homescreen(),
        Approutenames.OnBoardingScreenRoutename: (context) => OnBoardingPage(),
        Approutenames.loginRoutename: (context) => Loginpage(),
        Approutenames.createaccRoutename: (context) => Createaccountpage(),
        Approutenames.ResetPassRoutename: (context) => Resetpassword(),
        Approutenames.HomeTab: (context) => Hometab(),
        Approutenames.createevent: (context) => Createevent(),
        Approutenames.Profiletab: (context) => Profiletab(),
      },
    );
  }
}
