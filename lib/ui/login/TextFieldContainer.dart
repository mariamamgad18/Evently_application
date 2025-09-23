import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/app_theme.dart';

class Textfieldcontainer extends StatelessWidget {

  final String text;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  Textfieldcontainer({required this.text,
    required this.prefixIcon,
    this.suffixIcon,});
  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Appcolors.transparentColor,
          contentPadding: EdgeInsets.symmetric(vertical: Height * 0.02, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppTheme.TextFieldContainerColor(context),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppTheme.TextFieldContainerColor(context),
              width: 2,
            ),
          ),
          hintText:text,
          suffixIcon: Icon(
              suffixIcon,
            color: AppTheme.TextFieldIconColor(context),
          ),

      prefixIcon:  Icon(
        prefixIcon,
        color: AppTheme.TextFieldIconColor(context),
      ),

        ),
      ),
    );

  }
}

