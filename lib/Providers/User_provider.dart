import 'package:flutter/material.dart';

import '../Models/User.dart';
//عشان احنا محتاجين بيانات اليوزر جوه  و هتتغير ف كا مكان
class UserProvider extends ChangeNotifier {
  //todo:الداتا اللي اما بتتغير بتأقر ف اكتر من مكان
  //الداتا الي محتاجه اشيلها عندي اليوزر هو ده اللي تبيغر ف اكتر مت مكان
  myUser? currentuser; //خليتها nullable عشان ممكن ميكونش في يوزر
//todo:الفانكشن الل بتغير

  /*الفانشكن دي هنادي عليها ف اللوج ان و الريجيستر
  عشان
   */
void updateUser(myUser newUser){
  currentuser=newUser;
notifyListeners();  //عشان تبعت نوتفيكيشن لاي حد بيلسن ع البروفايدر ف اللحظه دي و يقوله خلي بالك اليوزر الل عندي اتغير
}

}