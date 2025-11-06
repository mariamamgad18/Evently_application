import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // استيراد الترجمة

import '../../Providers/User_provider.dart';
import '../../Providers/app_langeuge_provider.dart';
import '../../Providers/app_theme_provider.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/app_theme.dart';

class Profiletab extends StatefulWidget {
  @override
  _ProfiletabState createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  void _showLanguageBottomSheet() {
    final loc = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(loc.arabic),
              onTap: () {
                Provider.of<Applanguegeprovider>(context, listen: false)
                    .ChangeLanguage('ar'); // رمز اللغة العربية
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(loc.english),
              onTap: () {
                Provider.of<Applanguegeprovider>(context, listen: false)
                    .ChangeLanguage('en'); // رمز اللغة الإنجليزية
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showThemeBottomSheet() {
    final loc = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(loc.english == "English" ? "Light" : "فاتح"), // مثال بسيط للترجمة اليدوية للثيم
              onTap: () {
                Provider.of<Appthemeprovider>(context, listen: false)
                    .toggleTheme(true); // true = Light
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(loc.dark),
              onTap: () {
                Provider.of<Appthemeprovider>(context, listen: false)
                    .toggleTheme(false); // false = Dark
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<Applanguegeprovider>(context);
    var themeProvider = Provider.of<Appthemeprovider>(context);
    final loc = AppLocalizations.of(context)!;
    var userProvider = Provider.of<UserProvider>(context);

    // عرض اللغة حسب رمز اللغة
    String displayedLanguage =
    languageProvider.appLanguege == 'ar' ? loc.arabic : loc.english;

    // عرض الثيم حسب الحالة
    String displayedTheme = themeProvider.isLightTheme ? "Light" : loc.dark;
    // يمكنك إضافة ترجمة لكلمة "Light" في ملفات الترجمة واستخدامها هنا بدل النص الثابت

    return Scaffold(
      backgroundColor: AppTheme.scaffoldcolor(context),
      appBar: AppBar(
        backgroundColor: AppTheme.appBarcolor(context),
      ),
      body: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: AppTheme.appBarcolor(context),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Appimages.Rotelogo2),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            userProvider.currentuser!.name
                            ,style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Appcolors.whitecolor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          userProvider.currentuser!.email,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.whitecolor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                loc.language,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          GestureDetector(
            onTap: _showLanguageBottomSheet,
            child: Container(
              width: 361,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Appcolors.lightbluecolor),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    displayedLanguage,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Appcolors.lightbluecolor,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Appcolors.lightbluecolor),
                ],
              ),
            ),
          ),

          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                loc.theme,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          GestureDetector(
            onTap: _showThemeBottomSheet,
            child: Container(
              width: 361,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Appcolors.lightbluecolor),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    displayedTheme,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Appcolors.lightbluecolor,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Appcolors.lightbluecolor),
                ],
              ),
            ),
          ),
          SizedBox(height: 45),

          Image.asset(Appimages.logout)
        ],
      ),
    );
  }
}