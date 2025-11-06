class Event {
  static const String CollectionName="Events";
  String EventID;
  String EventTitle;
  String EventDescription;
  String EventImage;
  String EventName;
  DateTime EventDateTime;
  String EventTime;
  bool isFavorite;

  Event(
  {
    this.EventID="",
    required this.EventTitle,
    required this.EventDateTime,
    required this.EventDescription,
    required this.EventImage,
    required this.EventName,
    required this.EventTime,
     this.isFavorite =false,


  }
      );
  //todo:obj > json

Map<String,dynamic> toJson(){
return {
  'EventID':EventID,
  'EventTitle':EventTitle,
  'EventDateTime':EventDateTime.millisecondsSinceEpoch,
  'EventDescription':EventDescription,
  'EventImage':EventImage,
  'EventName':EventName,
  'EventTime':EventTime,
  'isFavorite':isFavorite,


};
}

//todo: json > obj

Event.FromJsonToObject(Map<String,dynamic>data):this(
    EventID:data['EventID'],
 EventTitle:data['EventTitle'],
 EventDescription:data['EventDescription'],
 EventImage:data['EventImage'],
     EventName:data['EventName'],
     EventDateTime:DateTime.fromMillisecondsSinceEpoch(data['EventDateTime'] ),
     EventTime:data['EventTime'],
     isFavorite:data['isFavorite'],
);
}