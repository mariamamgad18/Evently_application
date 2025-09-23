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

  );


  // ثيم الوضع الداكن
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Appcolors.darkbluecolor,
    canvasColor: Appcolors.whitecolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Appcolors.darkbluecolor,
        type: BottomNavigationBarType.fixed,
          selectedItemColor: Appcolors.whitecolor
          , unselectedItemColor:  Appcolors.whitecolor      )
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
}
