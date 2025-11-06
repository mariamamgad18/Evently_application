import 'package:eventlyapp/Models/Event.dart';
import 'package:eventlyapp/utils/AppColors.dart';
import 'package:eventlyapp/utils/AppImages.dart';
import 'package:eventlyapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Firebase_Utils.dart';
import '../../Providers/Event_List_Provider.dart';
import '../../Providers/User_provider.dart';
import '../../utils/dialog_utils.dart';
import '../home/EventTab.dart';
import '../login/BlueButton.dart';
import 'DatePicker.dart';
import 'EventDetailsPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Createevent extends StatefulWidget {
  const Createevent({super.key});

  @override
  State<Createevent> createState() => _CreateeventState();
}
late  UserProvider userProvider;

class _CreateeventState extends State<Createevent> {
  String selectedEventImage = '';
  String selectedEventName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  int selectedindex = 0;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late EventListProvider eventlistprovider;

  @override
  Widget build(BuildContext context) {
    eventlistprovider = Provider.of<EventListProvider>(context);
    List<String> tabImages = [
      Appimages.birthdayimage,
      Appimages.Holidayimage,
      Appimages.Exhibitionimage,
      Appimages.meetingimage,
      Appimages.birthdayimage,
    ];

    List<String> eventName2 = [
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.sport,
    ];
    userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolors.transparentColor,
        title: Text(
          AppLocalizations.of(context)!.createEvent,
          style: TextStyle(
            color: Appcolors.lightbluecolor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Appcolors.redcolor,
                      image: DecorationImage(
                        image: AssetImage(
                            tabImages[selectedindex % tabImages.length]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DefaultTabController(
                    length: eventName2.length,
                    child: TabBar(
                      onTap: (index) {
                        selectedindex = index;
                        selectedEventImage =
                        tabImages[index % tabImages.length];
                        selectedEventName = eventName2[index];
                        setState(() {});
                      },
                      isScrollable: true,
                      labelPadding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: Appcolors.transparentColor,
                      dividerColor: Appcolors.transparentColor,
                      tabs: List.generate(
                        eventName2.length,
                            (index) => Eventtab(
                          isSelectd: selectedindex == index,
                          eventText: eventName2[index],
                          selectedColor: Appcolors.lightbluecolor,
                          unselectedColor: Appcolors.transparentColor,
                          selectedtextColor: Appcolors.whitecolor,
                          unselectedtextColor: Appcolors.lightbluecolor,
                          selectedbordertColor: Appcolors.lightbluecolor,
                          unselectedbordertColor: Appcolors.transparentColor,
                          bordertColor: Appcolors.lightbluecolor,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textColor(context),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.eventTitle,
                    prefixIcon: Image.asset(
                      AppTheme.imageicon(context),
                      width: 18,
                      height: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppTheme.TextFieldContainerColor(context),
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textColor(context),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText:
                    AppLocalizations.of(context)!.eventDescription,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppTheme.TextFieldContainerColor(context),
                        width: 1,
                      ),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: 16, top: 20, bottom: 30),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppTheme.Eventimageicon(context),
                          width: 16,
                          height: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          AppLocalizations.of(context)!.eventDate,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textColor(context),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        final date = await Datepicker.pickDate(context);
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: Text(
                        selectedDate == null
                            ? AppLocalizations.of(context)!.chooseDate
                            : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.lightbluecolor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppTheme.Timeimageicon(context),
                          width: 16,
                          height: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          AppLocalizations.of(context)!.eventTime,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textColor(context),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        final time = await Timepicker.pickTime(context);
                        if (time != null) {
                          setState(() {
                            selectedTime = time;
                          });
                        }
                      },
                      child: Text(
                        selectedTime == null
                            ? AppLocalizations.of(context)!.choosetime
                            : "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.lightbluecolor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.location,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textColor(context),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolors.transparentColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Appcolors.lightbluecolor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppTheme.LocationIcon(context),
                              width: 46,
                              height: 46,
                            ),
                            SizedBox(width: 7),
                            Text(
                              AppLocalizations.of(context)!
                                  .chooseEventLocation,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.lightbluecolor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Appcolors.lightbluecolor,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState?.validate() == true) {
                      addEvent();
                    }
                  },
                  child: Bluebutton(
                    buttontext: AppLocalizations.of(context)!.addEvent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() async {
    if (selectedDate != null && selectedTime != null) {
      Event event = Event(
        EventTitle: titleController.text,
        EventDateTime: selectedDate!,
        EventDescription: descriptionController.text,
        EventImage: selectedEventImage,
        EventName: selectedEventName,
        EventTime:
        "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}",
      );

      try {
        await FirebaseUtils.AddEventToFireStore(event,userProvider.currentuser!.id);

        // بعد ما الحدث يتضاف بنجاح:
        DialogMessage.showDialogMessage(
          context: context,
          message: "Event added successfully!!",
          bgColor: Appcolors.lightbluecolor,
          textColor: Appcolors.whitecolor,
        );

        // حدّثي الليست بتاعت الأحداث
        eventlistprovider.getAllEvents(userProvider.currentuser!.id);

        // انتظري ثانيتين عشان المستخدم يشوف الرسالة
        await Future.delayed(const Duration(seconds: 2));

        // رجّعي المستخدم للصفحة اللي قبلها
        if (mounted) Navigator.pop(context);

      } catch (e) {
        DialogMessage.showDialogMessage(
          context: context,
          message: "Error adding event: $e",
          bgColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } else {
      DialogMessage .showDialogMessage(
        context: context,
        message: "Please select date and time",
        bgColor: Colors.orange,
        textColor: Colors.white,
      );
    }
  }

}
