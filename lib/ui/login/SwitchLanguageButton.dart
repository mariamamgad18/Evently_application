import 'package:flutter/cupertino.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';

class Switchlanguagebutton extends StatefulWidget {

  @override
  State<Switchlanguagebutton> createState() => _SwitchlanguagebuttonState();
}

class _SwitchlanguagebuttonState extends State<Switchlanguagebutton> {
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        setState(() {
          isSwitched=true;
        });
      },
      child: Container(
        width: Width*0.186,
        height: Height*0.036,
        decoration: BoxDecoration(
            color: Appcolors.transparentColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Appcolors.lightbluecolor
            )
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              isSwitched?
              Appimages.flag1:Appimages.flag2,fit: BoxFit.fill,),

            Image.asset(isSwitched?
            Appimages.flag2:Appimages.flag1,fit: BoxFit.fill,),

          ],),
      ),
    );
  }
}
