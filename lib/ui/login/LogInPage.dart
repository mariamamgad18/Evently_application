import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../Firebase_Utils.dart';
import '../../Providers/User_provider.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppRouteNames.dart';
import '../../utils/app_theme.dart';
import '../../utils/dialog_utils.dart';
import '../home/HomeScreen.dart';
import 'BlueButton.dart';
import 'CreateAccountPage.dart';
import 'ResetPassword.dart';
import 'SwitchLanguageButton.dart';
import 'TextFieldContainer.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  void login() async {
    // استخدمنا async لأن الدالة فيها عمليات بتاخد وقت (زي await مع Firebase)



    if (formKey.currentState?.validate() == true) {
      // بيتأكد الأول إن البيانات اللي في الفورم (الإيميل والباسورد) اتحققت من شروط الـ validation




      DialogMessage.showLoading(context: context, msg: "Loading...");
      // بيعرض Dialog فيه رسالة "Loading..." لحد ما عملية تسجيل الدخول تخلص




      try {
        // هنا بنحط الكود اللي ممكن يحصل فيه خطأ داخل try

        // تسجيل الدخول باستخدام Firebase Authentication
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),   // trim() بتشيل أي مسافات زيادة في أول أو آخر الإيميل
          password: passwordController.text.trim(), // نفس الكلام للباسورد
        );






        // بعد ما نسجل الدخول، نقرأ بيانات اليوزر من الـ Firestore عن طريق الـ uid بتاعه
        final user = await FirebaseUtils.readUserFromFireStore(credential.user?.uid ?? '');
        // لو الـ uid طلع null لأي سبب، هنرجع string فاضي بدل ما الكود يبوظ





        //ان عايزة استخدم البروفايدر بتاع اليوزر جوه فانكشن اللوج ان بس مفيش بيلد !! ي اما اعرفها بره ب late ي اما في طريقه تانيه todo:
        // بس عشان يتعرف بره البيلد لازم ابعت الاوبشنال باراميتر اسمه listen و اخليه ب false
        // If listen is true, later value changes will trigger a new State. build to widgets
        //يعني اخر فاليو حصلها تغيير هتسمع و تظهر ف البيلد عادي
//listen: false is necessary to be able to call Provider. of inside State. initState or the create method of providers

        //  يعني لو ب false هات الداتا اللي عندك مره واحده بس و متبعتش نوتفكيشن لو الداتا اتغيرت تاني
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user!);






        DialogMessage.hideLoading(context: context);
        // بنخفي الـ Loading dialog قبل ما نعرض أي Dialog جديد (مهم جدًا عشان ميحصلش تهنيج)






        if (user == null) {
          // لو الدالة مرجعتش بيانات (يعني اليوزر مش موجود في Firestore)
          DialogMessage.showSuccsessOrErrorMessage(
            context: context,
            dialogmessage: "User data not found in Firestore. Please create an account again.",
            dialogtitle: "Error !!",
            PossitiveButtonText: "Ok",
          );
          return; // بنرجع عشان نوقف الكود هنا ومندخلش على الهوم
        }







        // لو وصلنا هنا يبقى اليوزر موجود فعلاً فـ Firestore
        await DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: "Login successfully!", // رسالة نجاح
          dialogtitle: "Success !!",
          PossitiveButtonText: "Ok",
        );



        // بعد ما المستخدم يضغط OK على الرسالة، التطبيق هينقله على شاشة الهوم
        Navigator.of(context).pushReplacementNamed(
          Approutenames.HomeScreenRoutename, // اسم الراوت بتاع صفحة الهوم
        );





      } on FirebaseAuthException catch (e) {
        // ده الـ catch الخاص بأخطاء تسجيل الدخول في Firebase Authentication
        DialogMessage.hideLoading(context: context); // نخفي اللودينج في حالة الخطأ

        String errorMessage; // متغير نحط فيه الرسالة المناسبة حسب نوع الخطأ
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.'; // لو الإيميل مش متسجل
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.'; // لو الباسورد غلط
        } else {
          errorMessage = 'Authentication failed. Please try again.'; // أي خطأ تاني عام
        }








        // نعرض رسالة الخطأ للمستخدم
        DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: errorMessage,
          dialogtitle: "Error !!",
          PossitiveButtonText: "Ok",
        );






      } catch (e) {
        // ده الـ catch العام لأي خطأ تاني غير أخطاء الـ FirebaseAuth
        DialogMessage.hideLoading(context: context);
        DialogMessage.showSuccsessOrErrorMessage(
          context: context,
          dialogmessage: e.toString(), // نعرض نص الخطأ نفسه
          dialogtitle: "Error !!",
          PossitiveButtonText: "Ok",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                Appimages.Eventlylogo,
                width: Width * 0.3,
                height: Height * 0.2,
              ),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.email,
                prefixIcon: Icons.email,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email requried";
                  }
                  return null;
                },
              ),
              Textfieldcontainer(
                text: AppLocalizations.of(context)!.password,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password requried";
                  }
                  return null;
                },
              ),
              InkWell(
                child: Text(
                  AppLocalizations.of(context)!.forgetPassword,
                  style: TextStyle(
                    color: Appcolors.lightbluecolor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Resetpassword()),
                  );
                },
              ),
              InkWell(
                onTap: login,
                child: Bluebutton(
                  buttontext: AppLocalizations.of(context)!.login,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.noAccount,
                      style: TextStyle(color: Appcolors.blackcolor),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.createAccount,
                      style: TextStyle(
                        color: Appcolors.lightbluecolor,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Createaccountpage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  Appimages.or,
                  width: 270,
                  height: Height * 0.022,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                width: Width * 0.9,
                height: Height * 0.080,
                decoration: BoxDecoration(
                  color: Appcolors.transparentColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Appcolors.lightbluecolor),
                ),
                child: Row(
                  children: [
                    Image.asset(Appimages.google),
                    SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.loginWithGoogle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.lightbluecolor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Switchlanguagebutton(),
            ],
          ),
        ),
      ),
    );
  }
}
