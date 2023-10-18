import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/choose_lang_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatelessWidget {
  static const routeName = "/languagePage";
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
            top: 130.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "as-salom",
                style: Styles.asSalomText,
              ),
              ScreenUtil().setVerticalSpacing(50),
              Text(
                "Выберите язык",
                style: Styles.chooseText,
              ),
              ScreenUtil().setVerticalSpacing(35),
             const ChooseButtonLang(langName: "Русский"),
              ScreenUtil().setVerticalSpacing(15),
             const ChooseButtonLang(langName: "O'zbek tili"),
              ScreenUtil().setVerticalSpacing(15),
             const ChooseButtonLang(langName: "English"),
            ],
          ),
        ),
      ),
    );
  }
}
