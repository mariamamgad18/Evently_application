import '../../utils/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventData {
  final String eventName;
  final int day;
  final String month;
  final String image;

  EventData({
    required this.eventName,
    required this.day,
    required this.month,
    required this.image,
  });
}

final Map<int, EventData> eventMap = {
  1: EventData(
    eventName: "Birthday Celebration - Family Gathering At Home",
    day: 5,
    month: "Jan",
    image: Appimages.birthdayimage,
  ),
  2: EventData(
    eventName: "Business Meeting - Project Planning And Updates",
    day: 12,
    month: "Feb",
    image: Appimages.meetingimage,
  ),
  3: EventData(
    eventName: "Exhibition Event - Modern Art And Creative Designs",
    day: 20,
    month: "Mar",
    image: Appimages.Exhibitionimage,
  ),
  4: EventData(
    eventName: "Holiday Trip - Relaxing Beach Vacation With Friends",
    day: 8,
    month: "Apr",
    image: Appimages.Holidayimage,
  ),
  5: EventData(
    eventName: "Birthday Party - Fun Night Out With Close Friends",
    day: 15,
    month: "May",
    image: Appimages.birthdayimage,
  ),
  6: EventData(
    eventName: "Online Meeting - Remote Team Collaboration Session",
    day: 22,
    month: "Jun",
    image: Appimages.meetingimage,
  ),
  7: EventData(
    eventName: "Photography Exhibition - Outdoor Photo Showcase",
    day: 3,
    month: "Jul",
    image: Appimages.Exhibitionimage,
  ),
  8: EventData(
    eventName: "Holiday Adventure - Hiking Trip In The Mountains",
    day: 18,
    month: "Aug",
    image: Appimages.Holidayimage,
  ),
  9: EventData(
    eventName: "Surprise Birthday - Special Celebration With Friends",
    day: 25,
    month: "Sep",
    image: Appimages.birthdayimage,
  ),
  10: EventData(
    eventName: "Client Meeting - Business Proposal And Discussion",
    day: 7,
    month: "Oct",
    image: Appimages.meetingimage,
  ),
  11: EventData(
    eventName: "Science Exhibition - Innovation And Technology Fair",
    day: 14,
    month: "Nov",
    image: Appimages.Exhibitionimage,
  ),
  12: EventData(
    eventName: "Desert Holiday - Camping And Adventure Exploration",
    day: 31,
    month: "Dec",
    image: Appimages.Holidayimage,
  ),
};
