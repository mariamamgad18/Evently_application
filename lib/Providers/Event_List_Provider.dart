import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Firebase_Utils.dart';
import '../Models/Event.dart';
import '../utils/AppColors.dart';
import '../utils/dialog_utils.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> Eventlist = [];
  List<Event> FilteredEventslist = [];
  List<Event> FavoriteEventslist = [];

  List<String> eventNamelist = [];
  int selectedindex = 0;

  List<String> geteventNamelist(BuildContext context) {
    return eventNamelist = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  void getAllEvents(String userid) async {
    QuerySnapshot<Event> querySnapshot =
    await FirebaseUtils.GetEventCollection( userid).get();
    Eventlist = querySnapshot.docs.map((QueryDocumentSnapshot<Event> doc) {
      return doc.data();
    }).toList();
    FilteredEventslist = Eventlist;
    // sorting
    FilteredEventslist.sort(
          (a, b) {
        return a.EventDateTime.compareTo(b.EventDateTime);
      },
    );
    notifyListeners();
  }

  void getFilteredEvents(String userid) async {
    QuerySnapshot<Event> querySnapshot =
    await FirebaseUtils.GetEventCollection( userid).get();
    Eventlist = querySnapshot.docs.map((QueryDocumentSnapshot<Event> doc) {
      return doc.data();
    }).toList();
    FilteredEventslist = Eventlist.where((event) {
      return event.EventName == eventNamelist[selectedindex];
    }).toList();
    // sorting
    FilteredEventslist.sort(
          (a, b) {
        return a.EventDateTime.compareTo(b.EventDateTime);
      },
    );
    notifyListeners();
  }

  // طريقة تانية
  void getFilteredEventsFromFireStore(String userid) async {
    QuerySnapshot<Event> querySnapshot = await FirebaseUtils.GetEventCollection( userid)
        .where('EventName', isEqualTo: eventNamelist[selectedindex])
        .get();
    FilteredEventslist = querySnapshot.docs.map((QueryDocumentSnapshot<Event> doc) {
      return doc.data();
    }).toList();

    notifyListeners(); // لتحديث الواجهة
  }

  void changeselectedindex(int newselectedindex , String userid) {
    selectedindex = newselectedindex;
    if (selectedindex == 0) {
      getAllEvents(userid);
    } else {
      getFilteredEvents(userid);
    }
  }

  void getFavoriteEvents(String userid) async {
    QuerySnapshot<Event> querySnapshot = await FirebaseUtils.GetEventCollection(userid)
        //.where('isFavorite', isEqualTo: true)
        .get();
    Eventlist=querySnapshot.docs.map((QueryDocumentSnapshot<Event> doc){
   return doc.data();

    }).toList();
    FavoriteEventslist=Eventlist.where((event){
      return event.isFavorite==true;
    }).toList();
    FavoriteEventslist.sort(
          (a, b) {
        return a.EventDateTime.compareTo(b.EventDateTime);
      },
    );
    notifyListeners(); // لتحديث الواجهة

  }


  // تحديث حالة isFavorite
  Future<void> updatingisfavoritEvent(Event event, BuildContext context ,String userid) async{
    FirebaseUtils.GetEventCollection(userid)
        .doc(event.EventID)
        .update({'isFavorite': !event.isFavorite})
        .then((onValue) {
      DialogMessage.showDialogMessage(
        context: context,
        message: "Event added to favorite list",
        bgColor: Appcolors.lightbluecolor,
        textColor: Appcolors.whitecolor,
      );


      if (selectedindex == 0) {
        getAllEvents(userid);
      } else {
        getFilteredEvents(userid);
      }
      getFavoriteEvents(userid);
      notifyListeners(); // لتحديث الواجهة
    });


  }
}
