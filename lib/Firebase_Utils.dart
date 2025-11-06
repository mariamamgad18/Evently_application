import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/Models/User.dart';

import 'Models/Event.dart';

class FirebaseUtils {
  static CollectionReference<Event > GetEventCollection(String userid){
    return  getUsersCollection().doc(userid).collection(Event.CollectionName)

    .withConverter<Event>(
      fromFirestore: (snapshot,options)=>Event.FromJsonToObject(snapshot.data()!),
      toFirestore: (Event, options) =>Event.toJson() ,);
    //بدلت ده :
      //FirebaseFirestore.instance.collection(Event.CollectionName).

// عشان اقدر اعمل كولكشن جوه الدوكيمنت عشان كل يوزر يكون له الاينفتس بتاعته

  }

  static Future<void> AddEventToFireStore (Event event,String userid){
    //todo: 1-create collection
    CollectionReference<Event > CollectionRef =GetEventCollection(userid);

    //todo: 2-create document
    DocumentReference<Event > DocRef =CollectionRef.doc();
    //todo: 3-assign auto doc id generated to event id
    event.EventID = DocRef.id;
    //todo: 4- save data

    return DocRef.set(event);


   // return GetEventCollection().doc( event.EventID).set(event);  كان ممكن استبدل كل ده بالسطر ده

  }

/////////////////////////////////////////////////////////////////////////
  static CollectionReference<myUser> getUsersCollection(){
    //هروح اجيب الكولكشن
  return  FirebaseFirestore.instance.collection(myUser.CollectionName). //.collection دي بتدور لو في كولكشن بنفس الاسم هتجيبه لو مفيش هتكرييته
    withConverter<myUser>( //بتاخد تمبلت باراميتر من الموديل
        fromFirestore: (snapshot,options)=>myUser.FromJsonToObject(snapshot.data()!),
        toFirestore: (myUser, options) =>myUser.toJson() );
  } //كده جبنا الكولكشن و الداتا اللي فيه

// هخزن اليوزر  اللي عمل auth ف الفايربيز
  static  Future<void> AddUserToFireStore (myUser user){
    //بجيب الكولكشن و بعمل جواه دوكيمنت و بعدين بستخدم الميثود

    return getUsersCollection().doc(user.id).set(user);
  }
  //////////////////////////////////////////////////////////////////////
//دلوقتي عشان نتاكد ان الداتا دي موجوده فعلا ف الفايربيز فاير ستور
//يعني عشان اما ييجي يعمل login يروح يت Check بالايميل و الباسوورد لو موجودين فعلا او لا

  static Future<myUser?> readUserFromFireStore(String id) async {
    var querysnapshot = await getUsersCollection().doc(id).get();

    if (!querysnapshot.exists) {
      // لو مفيش document بالـ id ده
      return null;
    }

    return querysnapshot.data(); // دي هترجع myUser لأنك مستخدمة withConverter
  }


//
}






