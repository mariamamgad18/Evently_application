import 'package:eventlyapp/utils/AppColors.dart';
import 'package:flutter/material.dart';

class DialogMessage {
  static Future<void> showDialogMessage({
    required BuildContext context,
    required String message,
    required Color bgColor,
    required Color textColor,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

///////////////////////////////////////////
  static Future <void> showLoading({
    required BuildContext context,
    required String msg,

  }) {
    return showDialog(
      barrierDismissible: false,
      //عشان ميقدرش يكنسل الديالوج لو ضغط علي حته ف السكرينه
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: Appcolors.lightbluecolor,),
              SizedBox(width: 10,),
              Text(msg, style: TextStyle(color: Appcolors.blackcolor),)
            ],
          ),
        );
      },);
  }


  /////////////////////////////////
  static void hideLoading({
    required BuildContext context,
  }) {
//عشان اخفي حاجه يبقي navigator.pop
    Navigator.pop(context); //هخلي الكونتكست ده ريكوايرد
  }

//////////////////////////////////ظظظظظظظظظظظظظظظظظظظظظظظظظظظظ
  static Future<void> showSuccsessOrErrorMessage(
      //المسدج اللي هتظهر لو حصل ايرور او لو نجح
          {required BuildContext context,
        required String dialogmessage,
        String?dialogtitle,
        String?PossitiveButtonText,
        Function ?PossitiveAction,
        String?negativeButtonText,
        Function ?negativeAction
      }) {
    List<Widget>?actions = []; // هنعمل ليسته فاضيه
    if (PossitiveButtonText != null) //يعني لو بعت قيمه هنا
        {
      actions.add(
        TextButton(
            onPressed: () {
              // Navigator.pop(context);  بس مش شرط بردو ممكن يحتاج ينفز اي حاجه تانيه غير انه يقفل الديالوج
              // ف هعمل فانكشن بردو هو الل يملاها

              //if(PossitiveAction!=null){ //تاكيدا بس ان القيمه مش فاضيه
              // PossitiveAction.call()
              // }
              //هي هي لو عملت كده :
              PossitiveAction?.call();
              //call دي معناها لو بعتلي كود هنفزه
              Navigator.pop(
                  context); //لو مبعتش الفانكشن خلاص يبقي اقفل الديالوج
            },
            child: Text(PossitiveButtonText,
                style: TextStyle(color: Appcolors.blackcolor))),
      );
    }
    if (negativeButtonText != null) //يعني لو بعت قيمه هنا
        {
      actions.add(
        TextButton(
            onPressed: () {

              negativeAction?.call();
              Navigator.pop(
                  context);
            },
            child: Text(negativeButtonText,
                style: TextStyle(color: Appcolors.blackcolor))),
      );
    }
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Center(child: Text(
                dialogmessage, style: TextStyle(color: Appcolors.blackcolor))),
            title: Center(child: Text(
                dialogtitle ?? '' //يعني في حاله اني مبعتوش  هيسيبه فاضي
                , style: TextStyle(color: Appcolors.blackcolor))),
            // ممكن اعمل كده  actions: [
            //
            //         ],
            // عشان احط الزارير بس كده هثبت عددهم , انا عايزة اوقات يكون في زرار واحد و اوقات يكون في اتنين او اكتر
            // فعمل ليسته فاضيه
            actions: actions, //لو بعت


          );
        },
      );
    }
  }


