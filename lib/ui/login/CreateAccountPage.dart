
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import 'BlueButton.dart';
import 'SwitchLanguageButton.dart';
import 'TextFieldContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Createaccountpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
  backgroundColor: Appcolors.transparentColor,
      title: Text(AppLocalizations.of(context) !.register,style: TextStyle(color: Appcolors.lightbluecolor,fontSize: 20,fontWeight: FontWeight.w400),),
),
      body: Column(
        children: [
          Image.asset(Appimages.Eventlylogo,width: Width*0.346,height:Height *0.221,),
          Textfieldcontainer(text:  AppLocalizations.of(context) !.name, prefixIcon: Icons.person),
          Textfieldcontainer(text: AppLocalizations.of(context) !.email, prefixIcon: Icons.email),
          Textfieldcontainer(text: AppLocalizations.of(context) !.password, prefixIcon: Icons.lock, suffixIcon: Icons.visibility,),
          Textfieldcontainer(text:  AppLocalizations.of(context) !.resetPassword, prefixIcon: Icons.lock,suffixIcon:Icons.visibility),

          Bluebutton(buttontext:  AppLocalizations.of(context) !.createAccount),

          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context) !.alreadyHaveAccount,
                  style: TextStyle(color: Appcolors.blackcolor),
                ),
                TextSpan(
                  text: AppLocalizations.of(context) !.login,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Appcolors.lightbluecolor,
                    fontStyle: FontStyle.italic,
                  ),

                ),
              ],
            ),
          ),

          Switchlanguagebutton()

        ],
      ),
    );
  }
}
