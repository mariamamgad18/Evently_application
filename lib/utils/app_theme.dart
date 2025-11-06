import 'package:eventlyapp/utils/AppImages.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppTheme {
  // ثيم الوضع الفاتح
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Appcolors.whitecolor,
     canvasColor: Appcolors.blackcolor,
 bottomNavigationBarTheme: BottomNavigationBarThemeData(
   backgroundColor: Appcolors.lightbluecolor,
   type: BottomNavigationBarType.fixed,
     selectedItemColor: Appcolors.whitecolor
, unselectedItemColor:  Appcolors.whitecolor

 ),
    floatingActionButtonTheme:FloatingActionButtonThemeData(
      backgroundColor: Appcolors.lightbluecolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(
          width: 4,
          color: Appcolors.whitecolor
        )
      )
    ),

  );


  // ثيم الوضع الداكن
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Appcolors.darkbluecolor,
    canvasColor: Appcolors.whitecolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Appcolors.darkbluecolor,
        type: BottomNavigationBarType.fixed,
          selectedItemColor: Appcolors.whitecolor
          , unselectedItemColor:  Appcolors.whitecolor      ),

    floatingActionButtonTheme:FloatingActionButtonThemeData(
        backgroundColor: Appcolors.lightbluecolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: BorderSide(
                width: 4,
                color: Appcolors.whitecolor
            )
        )
    ),
  );


static Color TextFieldContainerColor(BuildContext context) {
return Theme.of(context).brightness == Brightness.light
? Appcolors.grayecolor   // لو Light mode
    : Appcolors.lightbluecolor; // لو Dark mode
}
  static Color TextFieldIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.grayecolor   // لو Light mode
        : Appcolors.whitecolor; // لو Dark mode
  }
  static Color appBarcolor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.lightbluecolor   // لو Light mode
        : Appcolors.darkbluecolor; // لو Dark mode
  }

  static Color tapBarSelectedColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.whitecolor  // لو Light mode
        : Appcolors.lightbluecolor; // لو Dark mode
  }


  static Color tapBarSelectedtextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.lightbluecolor  // لو Light mode
        : Appcolors.whitecolor; // لو Dark mode
  }


  static Color textColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.blackcolor  // لو Light mode
        : Appcolors.whitecolor; // لو Dark mode
  }

  static Color scaffoldcolor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appcolors.whitecolor  // لو Light mode
        : Appcolors.darkbluecolor; // لو Dark mode
  }


  static String imageicon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appimages.lighticon // لو Light mode
        : Appimages.darkicon; // لو Dark mode
  }


  static String Eventimageicon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appimages.lighteventicon // لو Light mode
        : Appimages.darkeventicon; // لو Dark mode
  }
  static String Timeimageicon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appimages.lightTimeicon // لو Light mode
        : Appimages.darkTimeicon; // لو Dark mode
  }

  static String LocationIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Appimages.lightLocarionicon // لو Light mode
        : Appimages.darkLocarionicon; // لو Dark mode
  }
}
