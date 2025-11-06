import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/ui/home/EventContainer.dart';
import 'package:eventlyapp/ui/home/EventTab.dart';
import 'package:eventlyapp/utils/AppColors.dart';
import 'package:eventlyapp/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../Firebase_Utils.dart';
import '../../Models/Event.dart';
import '../../Providers/Event_List_Provider.dart';
import '../../Providers/User_provider.dart';
import '../../Providers/app_langeuge_provider.dart';
import '../../Providers/app_theme_provider.dart';
import '../../utils/app_theme.dart';
import 'EventData.dart';

class Hometab extends StatefulWidget {
  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  late  UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var eventlistprovider = Provider.of<EventListProvider>(context, listen: false);

      eventlistprovider.geteventNamelist(context);  // استدعِ الدالة لملء القائمة
      if (eventlistprovider.Eventlist.isEmpty) {
        eventlistprovider.getAllEvents(userProvider.currentuser!.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<Applanguegeprovider>(context);
    var themeProvider = Provider.of<Appthemeprovider>(context);
    var eventlistprovider = Provider.of<EventListProvider>(context);
     userProvider = Provider.of<UserProvider>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarcolor(context),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomeBack,
                  style: TextStyle(
                    fontSize: 14,
                    color: Appcolors.whitecolor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  userProvider.currentuser!.name
                  ,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Appcolors.whitecolor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    themeProvider.toggleTheme(!themeProvider.isLightTheme);
                  },
                  child: Image(
                    image: AssetImage(Appimages.Sun),
                    width: 35,
                    height: 35,
                    color: themeProvider.isLightTheme
                        ? Colors.orangeAccent
                        : Colors.grey[400],
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    if (languageProvider.appLanguege == 'en') {
                      languageProvider.ChangeLanguage('ar');
                    } else {
                      languageProvider.ChangeLanguage('en');
                    }
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
                        languageProvider.appLanguege == 'en' ? "EN" : "AR",
                        style: TextStyle(
                          color: AppTheme.appBarcolor(context),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        AppLocalizations.of(context)!.locationCairo,
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
                      length: eventlistprovider.eventNamelist.length,
                      child: TabBar(
                        onTap: (index) {
                          eventlistprovider.changeselectedindex(index,userProvider.currentuser!.id);
                        },
                        isScrollable: true,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Appcolors.transparentColor,
                        dividerColor: Appcolors.transparentColor,
                        tabs: List.generate(
                          eventlistprovider.eventNamelist.length,
                              (index) => Eventtab(
                            isSelectd: eventlistprovider.selectedindex == index,
                            eventText: eventlistprovider.eventNamelist[index],
                            selectedColor: Appcolors.transparentColor,
                            unselectedColor: Appcolors.lightbluecolor,
                            selectedtextColor: AppTheme.tapBarSelectedtextColor(context),
                            unselectedtextColor: Appcolors.whitecolor,
                            selectedbordertColor: AppTheme.tapBarSelectedColor(context),
                            unselectedbordertColor: Appcolors.transparentColor,
                            bordertColor: AppTheme.tapBarSelectedColor(context),
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
            child: eventlistprovider.FilteredEventslist.isEmpty
                ? Center(child: Text("No Event Found"))
                : ListView.builder(
              itemBuilder: (context, index) {
                final event = eventlistprovider.FilteredEventslist[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Eventcontainer(event: event),
                );
              },
              itemCount: eventlistprovider.FilteredEventslist.length,
            ),
          ),
        ],
      ),
    );
  }
}