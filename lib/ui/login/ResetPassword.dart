import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import 'BlueButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Resetpassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
    centerTitle: true,
    backgroundColor: Appcolors.transparentColor,
    title: Text( AppLocalizations.of(context) !.forgetPassword,style: TextStyle(color: Appcolors.lightbluecolor,fontSize: 20,fontWeight: FontWeight.w400),),
    ),
    body: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
  Image.asset(Appimages.resetpass,fit: BoxFit.fill,),
  Bluebutton(buttontext: AppLocalizations.of(context) !.resetPassword)

],
    )
    );
  }
}
