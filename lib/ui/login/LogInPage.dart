
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/app_theme.dart';
import '../home/HomeScreen.dart';
import 'BlueButton.dart';
import 'CreateAccountPage.dart';
import 'ResetPassword.dart';
import 'SwitchLanguageButton.dart';
import 'TextFieldContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loginpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Image.asset(Appimages.Eventlylogo,width:Width* 0.3,height:Height* 0.2),
          Textfieldcontainer(text:           AppLocalizations.of(context) !.email,
               prefixIcon: Icons.email),
          Textfieldcontainer(text:  AppLocalizations.of(context) !.password, prefixIcon: Icons.lock,suffixIcon: Icons.visibility),
InkWell(child:Text(AppLocalizations.of(context) !.forgetPassword,style: TextStyle(color: Appcolors.lightbluecolor,fontStyle: FontStyle.italic,decoration: TextDecoration.underline,fontSize: 16,fontWeight: FontWeight.w700,),textAlign: TextAlign.end,),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_) => Resetpassword()));

    })
  ,
          InkWell(child: Bluebutton(buttontext: AppLocalizations.of(context) !.login,),
              onTap:(){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homescreen()));

              },),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text:AppLocalizations.of(context) !.noAccount,
                  style: TextStyle(color: Appcolors.blackcolor),
                ),
                TextSpan(
                  text: AppLocalizations.of(context) !.createAccount,
                  style: TextStyle(
                    color: Appcolors.lightbluecolor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Createaccountpage()));
                    },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset(Appimages.or,width:270,height:Height *0.022,fit: BoxFit.fill,),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
            width:Width*0.9  ,
            height:Height *0.080 ,
            decoration: BoxDecoration(
          color: Appcolors.transparentColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Appcolors.lightbluecolor
              )
            ),
child: Row(
  children: [
    Image.asset(Appimages.google),
    SizedBox(width: 5,),
    Text(AppLocalizations.of(context) !.loginWithGoogle,style: TextStyle(
        fontSize: 20,fontWeight: FontWeight.w500,
      color: Appcolors.lightbluecolor

    ),)
  ],
),
          ),
          SizedBox(height: 25,),

          Switchlanguagebutton()

        ],),
      ),
    );
  }
}
