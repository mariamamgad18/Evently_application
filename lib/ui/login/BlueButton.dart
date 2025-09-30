import 'package:flutter/widgets.dart';

import '../../utils/AppColors.dart';

class Bluebutton extends StatelessWidget {
  String buttontext;
  Bluebutton({required this.buttontext});
  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Container(
        //width:Width* 0.9,
        height:Height*0.07 ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Appcolors.lightbluecolor,
          borderRadius: BorderRadius.circular(16),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            buttontext,
          style: TextStyle(
            color: Appcolors.whitecolor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }
}
