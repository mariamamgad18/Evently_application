import 'package:eventlyapp/utils/AppImages.dart';
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Eventdetailspage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Appcolors.transparentColor,
      title: Text(
        AppLocalizations.of(context) !.eventDetails,
        style: TextStyle(
          color: Appcolors.lightbluecolor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Appimages.Editicon,
            width: 24,
            height: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Appimages.Deleteicon,
            width: 24,
            height: 24,
          ),
        ),
      ],
    ),


    );
  }
}
