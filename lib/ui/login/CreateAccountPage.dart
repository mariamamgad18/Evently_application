
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import 'BlueButton.dart';
import 'SwitchLanguageButton.dart';
import 'TextFieldContainer.dart';

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
      title: Text("Register",style: TextStyle(color: Appcolors.lightbluecolor,fontSize: 20,fontWeight: FontWeight.w400),),
),
      body: Column(
        children: [
          Image.asset(Appimages.Eventlylogo,width: Width*0.346,height:Height *0.221,),
          Textfieldcontainer(text: "Name", prefixIcon: Icons.person),
          Textfieldcontainer(text: "Email", prefixIcon: Icons.email),
          Textfieldcontainer(text: "Password", prefixIcon: Icons.lock, suffixIcon: Icons.visibility,),
          Textfieldcontainer(text: "Re Password", prefixIcon: Icons.lock,suffixIcon:Icons.visibility),

          Bluebutton(buttontext: 'Create Account'),

          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: "Already Have Account ?",
                  style: TextStyle(color: Appcolors.blackcolor),
                ),
                TextSpan(
                  text: "Login",
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
