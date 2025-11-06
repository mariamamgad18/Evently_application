import 'package:flutter/material.dart';

class Applanguegeprovider extends ChangeNotifier{
String appLanguege = 'en';
void ChangeLanguage ( String newLanguege){
if(appLanguege==newLanguege){
return;
}
appLanguege=newLanguege;
notifyListeners();

}
}