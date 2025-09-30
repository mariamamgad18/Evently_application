import 'package:eventlyapp/ui/home/EventContainer.dart';
import 'package:eventlyapp/ui/home/EventTab.dart';
import 'package:eventlyapp/utils/AppColors.dart';
import 'package:eventlyapp/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/app_theme.dart';
import 'EventData.dart';

class Hometab extends StatefulWidget {
  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  bool isclicked =false;
int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    List<String>eventName=[
      AppLocalizations.of(context) !.all,
      AppLocalizations.of(context) !.sport,
      AppLocalizations.of(context) !.birthday,
      AppLocalizations.of(context) !.meeting,
      AppLocalizations.of(context) !.gaming,
      AppLocalizations.of(context) !.workshop,
      AppLocalizations.of(context) !.bookClub,
      AppLocalizations.of(context) !.exhibition,
      AppLocalizations.of(context) !.holiday,
      AppLocalizations.of(context) !.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppTheme.appBarcolor(context),
     title: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Column(
           children: [
             Text(      AppLocalizations.of(context) !.welcomeBack
          ,style:TextStyle(
               fontSize: 14,
               color: Appcolors.whitecolor
               ,
               fontWeight: FontWeight.w400,
             ),),
             Text("John Safwat",style:TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.w700,
                 color: Appcolors.whitecolor

             ),),


           ],
         ),

         Row(children: [
           Image(image: AssetImage(Appimages.Sun)),
           InkWell(
             onTap: () {
               setState(() {
                 isclicked = !isclicked;
               });
             },
             child: Container(
               padding: EdgeInsets.all(8),
               margin: EdgeInsets.all(7),
               width: 35,
               height: 35,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Appcolors.whitecolor,
               ),
               child: Center(
                 child: Text(
                   isclicked ? "AR" : "EN",
                   style: TextStyle(
                     color: AppTheme.appBarcolor(context),
                     fontSize: 14,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ),
             ),
           )

         ],)

       ],
     ),

      ),
 body: Column(
    children: [
    Container(
    height: 125,
      decoration: BoxDecoration(
        color: AppTheme.appBarcolor(context),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on_sharp, color: Appcolors.whitecolor),
                Text(
                  AppLocalizations.of(context) !.locationCairo,

                  style: TextStyle(
                    color: Appcolors.whitecolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DefaultTabController(
                length: eventName.length,
                child: TabBar(
                  onTap: (index) {
                    selectedindex = index;
                    setState(() {});
                  },
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Appcolors.transparentColor,
                  dividerColor: Appcolors.transparentColor,
                  tabs: List.generate(
                    eventName.length,
                        (index) => Eventtab(
                      isSelectd: selectedindex == index,
                      eventText: eventName[index], selectedColor: Appcolors.transparentColor,unselectedColor:Appcolors.lightbluecolor,
                          selectedtextColor: AppTheme.tapBarSelectedtextColor(context) ,
                          unselectedtextColor: Appcolors.whitecolor, selectedbordertColor: AppTheme.tapBarSelectedColor(context),
                          unselectedbordertColor:Appcolors.transparentColor, bordertColor: AppTheme.tapBarSelectedColor(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),

    Expanded(
    child: ListView.builder(
    itemBuilder: (context, index) {
    final event = eventMap[index + 1]!;
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
    child: Eventcontainer(
    imagename: event.image,
    day: event.day,
    month: event.month,
    eventTitle: event.eventName,
    ),
    );
    },
    itemCount: eventMap.length,
    ),
    ),
    ],
    ),


    );
  }
}
/*
*
*

:
*
* */
