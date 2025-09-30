import 'package:eventlyapp/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/app_theme.dart';

class Eventtab extends StatelessWidget {
  final bool isSelectd;
  final String eventText;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedtextColor;
  final Color unselectedtextColor;
  final Color selectedbordertColor;
  final Color unselectedbordertColor;
  final Color bordertColor;


  Eventtab({
    required this.isSelectd,
    required this.eventText,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedtextColor,
    required this.unselectedtextColor,
    required this.selectedbordertColor,
    required this.unselectedbordertColor,
    required this.bordertColor,

  });
// AppTheme.tapBarSelectedColor(context),
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color:bordertColor,
          width: 2,
        ),
        color: isSelectd
            ? selectedbordertColor
            :unselectedbordertColor,
        borderRadius: BorderRadius.circular(46),
      ),
      child: Text(
        eventText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isSelectd ? selectedtextColor : unselectedtextColor,
        ),
      ),
    );
  }
}

