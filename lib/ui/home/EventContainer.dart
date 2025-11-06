import'package:eventlyapp/Models/Event.dart';
import 'package:eventlyapp/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Providers/Event_List_Provider.dart';
import '../../Providers/User_provider.dart';
import '../../utils/AppColors.dart';
import '../../utils/app_theme.dart';

class Eventcontainer extends StatefulWidget {
final Event event;

Eventcontainer({
required this.event,
});

@override
State<Eventcontainer> createState() => _EventcontainerState();
}

class _EventcontainerState extends State<Eventcontainer> {
bool isBlue = false;
late  UserProvider userProvider;

@override
Widget build(BuildContext context) {
var Height = MediaQuery.of(context).size.height;
var Width = MediaQuery.of(context).size.width;
var eventlistprovider = Provider.of<EventListProvider>(context);
userProvider = Provider.of<UserProvider>(context);

return Container(
padding: EdgeInsets.symmetric(vertical: 10),
width: 0.918 * Width,
height: Height * 0.300,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(16),
image: DecorationImage(
image: AssetImage(widget.event.EventImage),
fit: BoxFit.fill,
),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Align(
alignment: Alignment.topLeft,
child: Container(
margin: EdgeInsets.only(left: 8),
padding: EdgeInsets.all(8),
width: 0.109 * Width,
height: Height * 0.0582,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
color: Theme.of(context).primaryColor,
),
child: Column(
children: [
Expanded(
child: Text(
widget.event.EventDateTime.day.toString(),
style: TextStyle(
fontSize: 10,
color: Appcolors.lightbluecolor,
fontWeight: FontWeight.w700,
),
),
),
Expanded(
child: Text(
DateFormat('MMM').format(widget.event.EventDateTime),
  style: TextStyle(
fontSize: 10,
color: Appcolors.lightbluecolor,
fontWeight: FontWeight.w700,
),
),
),
],
),
),
),
Container(
padding: EdgeInsets.symmetric(horizontal: 8),
width: 0.877 * Width,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
color: Theme.of(context).primaryColor,
),
child: Row(
children: [
Expanded(
child: Text(
widget.event.EventTitle,
style: TextStyle(
color: Theme.of(context).canvasColor,
fontSize: 14,
fontWeight: FontWeight.w700,
),
),
),
InkWell(
  onTap:
  (){
    eventlistprovider.updatingisfavoritEvent(widget.event, context,userProvider.currentuser!.id);

  },
  child: widget.event.isFavorite==true?
  Image.asset(
    width: 24,
    height: 24,
    Appimages.selectedlove,
    color:Appcolors.lightbluecolor ,
  ):
  Image.asset(

    Appimages.uselectedlove,
    color:Appcolors.lightbluecolor ,
  )
)
],
),
),
],
),
);
}
}