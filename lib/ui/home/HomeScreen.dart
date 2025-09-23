import 'package:flutter/material.dart';

import '../../utils/AppImages.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
bottomNavigationBar: BottomNavigationBar(
currentIndex: selectedindex,
    onTap: (index){
      selectedindex=index;
      setState(() {

      });
    },

    items: [
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedhome,
          UnSelectediconName: Appimages.uselectedhome,
          index: 0,
          label: "Home"),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedmap,
          UnSelectediconName: Appimages.uselectedmap,
          index: 1,
          label: "Map"),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedlove,
          UnSelectediconName: Appimages.uselectedlove,
          index: 2,
          label: "Love"),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedprofile,
          UnSelectediconName: Appimages.uselectedprofile,
          index: 3,
          label: "Profile"),

]),


    );
  }

  BottomNavigationBarItem BottomNavigationBuilditems ({
    required String SelectediconName,
    required String UnSelectediconName,
    required int index,
    required String label

}){

return BottomNavigationBarItem(
    icon: ImageIcon(AssetImage(
        selectedindex==index
            ? SelectediconName :
        UnSelectediconName
    )),

    label:label );


}
}
