//اي حاجه بعوز اسيفها ف فايربيو فاير ستور هروح اعملها موديل
 class myUser {
   static const String CollectionName="Users";  //
   String id;  // كل يوزر عنه id عشان لو عايزة أأكسس يوزر معين هوصله من خلاله
  String name;
  String email;
  //مش هخزن الباسوورد عشان خصوصيه اليوزر
   myUser({
     required this.id , // في الايفنت كنت بعمل auto id , هنا هجرب اديه بنفسي
     required this.email,
     required this.name
 });

 //todo:obj > json

   Map<String,dynamic> toJson(){
     //دي بستخدمها لو عايزة ابعت حاجه لل firebase firestore
     return {
       'id':id,
       'name':name,
       'email':email,
     };
   }
 //todo: json > obj
   myUser.FromJsonToObject(Map<String,dynamic>data):this(
     id:data['id'],
     name:data['name'],
     email:data['email'],
   );

 }