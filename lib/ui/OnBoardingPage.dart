import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/app_theme.dart';
import 'home/HomeScreen.dart';
import 'login/LogInPage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Loginpage()),
    );
  }

  PageViewModel buildPage(String centerImage, String text1, String text2) {
    return PageViewModel(
      decoration: PageDecoration(pageColor: Theme.of(context).primaryColor),
      titleWidget: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 117, vertical: 5),
              child: Image.asset(
                Appimages.Eventlylogo,
                height: 50,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 44, horizontal:5),
              child: Image.asset(
                centerImage,
                height:200,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 16),
              child: Text(
                text1,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Appcolors.lightbluecolor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).canvasColor,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      bodyWidget: const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme.of(context).primaryColor,
      pages: [
        buildPage(
          Appimages.onboarding1,
          "Personalize Your Experience",
          "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
        ),
        buildPage(
          Appimages.onboarding2,
          "Find Events That Inspire You",
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
        ),
        buildPage(
          Appimages.onboarding3,
          "Effortless Event Planning",
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
        ),
        buildPage(
          Appimages.onboarding4,
          "Connect with Friends & Share Moments",
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
        ),
      ],
      showSkipButton: false,
      showDoneButton: true,
      done: Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Appcolors.lightbluecolor,
        ),
      ),
      showNextButton: true,
      next: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Appcolors.lightbluecolor,
            width: 2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_outlined,
            color: Appcolors.lightbluecolor,
            size: 10,
          ),
        ),
      ),
      showBackButton: true,
      back: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Appcolors.lightbluecolor,
            width: 2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: Appcolors.lightbluecolor,
            size: 10,
          ),
        ),
      ),
      onDone: () => _onIntroEnd(context),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}