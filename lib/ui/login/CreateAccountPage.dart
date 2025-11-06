import 'package:eventlyapp/utils/AppRouteNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Firebase_Utils.dart';
import '../../Models/User.dart';
import '../../Providers/User_provider.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/dialog_utils.dart';
import 'BlueButton.dart';
import 'SwitchLanguageButton.dart';
import 'TextFieldContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Createaccountpage extends StatefulWidget {
  @override
  State<Createaccountpage> createState() => _CreateaccountpageState();
}

class _CreateaccountpageState extends State<Createaccountpage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      // 1- إظهار لودينج
      DialogMessage.showLoading(context: context, msg: "waiting ...");

      try {
        // 2- تسجيل المستخدم في Firebase
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );


// عايزة هنا قبل م اخفي اللودينج عايزة اتأكد انه راح  يسيفه ف firestore
        //هكرييت اوبجكت من يوزر عشان الفانكش بتاخد اوبجكت
        myUser user = myUser(
          //ده مش هاخده من اليوزر ده من  auth ,بس وارد يكون نل
            id: credential.user?.uid??'',     //لو نل حط سترينج فاضي
            email: emailController.text,
            name: nameController.text);

       await FirebaseUtils.AddUserToFireStore(user);  //السطر ده بيرجع فيوتشر يعني هخليه awit عشان ميمشيش الا اما يتاكد ان اليوزر اتسيف




        //ان عايزة استخدم البروفايدر بتاع اليوزر جوه فانكشن اللوج ان بس مفيش بيلد !! ي اما اعرفها بره ب late ي اما في طريقه تانيه todo:
        // بس عشان يتعرف بره البيلد لازم ابعت الاوبشنال باراميتر اسمه listen و اخليه ب false
        // If listen is true, later value changes will trigger a new State. build to widgets
        //يعني اخر فاليو حصلها تغيير هتسمع و تظهر ف البيلد عادي
//listen: false is necessary to be able to call Provider. of inside State. initState or the create method of providers

        //  يعني لو ب false هات الداتا اللي عندك مره واحده بس و متبعتش نوتفكيشن لو الداتا اتغيرت تاني
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user!);




        // 3- إخفاء اللودينج
        DialogMessage.hideLoading(context: context);

        // 4- إظهار رسالة نجاح + التنقل بعد الضغط على OK
        DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: "Register successfully!",
          dialogtitle: "Success !!",
          PossitiveButtonText: "OK",
          PossitiveAction: () {
            // ✅ نغلق الدايلوج أولًا
            Navigator.of(context, rootNavigator: true).pop();
            // ✅ ثم نؤجل النافيجيشن ليحدث بعد إغلاق الدايلوج تمامًا
            Future.microtask(() {
              Navigator.pushReplacementNamed(
                context,
                Approutenames.loginRoutename,
              );
            });
          },
        );

        print(credential.user?.uid ?? '');

      } on FirebaseAuthException catch (e) {
        DialogMessage.hideLoading(context: context);
        String message = "An error occurred.";

        if (e.code == 'weak-password') {
          message = "The password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          message = "The account already exists for that email.";
        }

        DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: message,
          dialogtitle: "Error !!",
          PossitiveButtonText: "OK",
        );
      } catch (e) {
        DialogMessage.hideLoading(context: context);
        DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: e.toString(),
          dialogtitle: "Error !!",
          PossitiveButtonText: "OK",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolors.transparentColor,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: TextStyle(
              color: Appcolors.lightbluecolor,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(Appimages.Eventlylogo,
                  width: Width * 0.346, height: Height * 0.221),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.name,
                prefixIcon: Icons.person,
                controller: nameController,
                validator: (value) =>
                value == null || value.isEmpty ? "name required" : null,
              ),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.email,
                prefixIcon: Icons.email,
                controller: emailController,
                validator: (value) =>
                value == null || value.isEmpty ? "email required" : null,
              ),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.password,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                controller: passwordController,
                validator: (value) =>
                value == null || value.isEmpty ? "password required" : null,
              ),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.resetPassword,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                controller: repasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "repassword required";
                  } else if (value != passwordController.text) {
                    return "passwords do not match";
                  }
                  return null;
                },
              ),
              InkWell(
                onTap: register,
                child: Bluebutton(
                  buttontext: AppLocalizations.of(context)!.createAccount,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.alreadyHaveAccount,
                      style: TextStyle(color: Appcolors.blackcolor),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Appcolors.lightbluecolor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Switchlanguagebutton()
            ],
          ),
        ),
      ),
    );
  }
}
