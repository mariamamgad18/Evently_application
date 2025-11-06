import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';
import '../../utils/app_theme.dart';

class Textfieldcontainer extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller; // ✅ مضافة
  final String? Function(String?)? validator; // ✅ مضافة
  final bool obscureText; // ✅ عشان الباسورد

  const Textfieldcontainer({
    Key? key,
    required this.text,
    required this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField( // ✅ بدّلنا TextField بـ TextFormField
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Appcolors.transparentColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: 10,
          ),
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
          hintText: text,
          prefixIcon: Icon(
            prefixIcon,
            color: AppTheme.TextFieldIconColor(context),
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
            suffixIcon,
            color: AppTheme.TextFieldIconColor(context),
          )
              : null,
        ),
      ),
    );
  }
}
