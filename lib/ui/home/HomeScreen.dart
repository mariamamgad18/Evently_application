import 'package:eventlyapp/utils/AppColors.dart';
import 'package:flutter/material.dart';

import '../../utils/AppImages.dart';
import '../CreateEvent/CreateEvent.dart';
import 'HomeTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
int selectedindex=0;
List<Widget>tabs=[
  Hometab(),
  Hometab(),
  Hometab(),
  Hometab(),

];
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
          label:  AppLocalizations.of(context) !.home,
      ),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedmap,
          UnSelectediconName: Appimages.uselectedmap,
          index: 1,
          label:AppLocalizations.of(context) !.map,),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedlove,
          UnSelectediconName: Appimages.uselectedlove,
          index: 2,
          label: AppLocalizations.of(context) !.love,),
      BottomNavigationBuilditems(
          SelectediconName: Appimages.selectedprofile,
          UnSelectediconName: Appimages.uselectedprofile,
          index: 3,
          label: AppLocalizations.of(context) !.profile,),

]),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
floatingActionButton:FloatingActionButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (_) => Createevent()));
},
child: Icon(Icons.add,size: 24,color: Appcolors.whitecolor,),) ,

      body: tabs[selectedindex]
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
