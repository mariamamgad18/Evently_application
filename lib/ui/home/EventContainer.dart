import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';

import '../../utils/app_theme.dart';

class Eventcontainer extends StatefulWidget {
  final int day;
  final String month;
  final String imagename;
  final String eventTitle;

  Eventcontainer({
    required this.imagename,
    required this.day,
    required this.month,
    required this.eventTitle,
  });

  @override
  State<Eventcontainer> createState() => _EventcontainerState();
}

class _EventcontainerState extends State<Eventcontainer> {
  bool isBlue = false;

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 0.918 * Width,
      height: Height * 0.300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(widget.imagename),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Align(
           alignment: Alignment.topLeft,
           child:  Container(
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
                     widget.day.toString(),
                     style: TextStyle(
                       fontSize: 10,
                       color: Appcolors.lightbluecolor,
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                 ),
                 Expanded(
                   child: Text(
                     widget.month,
                     style: TextStyle(
                       fontSize:10,
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
           // height: Height * 0.0475,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.eventTitle,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isBlue ? Icons.favorite : Icons.favorite_border,
                    color: isBlue
                        ? Appcolors.lightbluecolor
                        : Appcolors.lightbluecolor,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      isBlue = !isBlue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
