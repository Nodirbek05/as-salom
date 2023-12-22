import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/initail/components/choose_lang_button.dart';
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
              SizedBox(
                height: 25,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/as-salom.png",
                  fit: BoxFit.contain,
                ),
              ),
              ScreenUtil().setVerticalSpacing(50),
              Text(
                "Выберите язык",
                style: Styles.chooseText,
              ),
              ScreenUtil().setVerticalSpacing(35),
              const ChooseButtonLang(
                langName: "Русский",
                index: 0,
              ),
              ScreenUtil().setVerticalSpacing(15),
              const ChooseButtonLang(
                langName: "O'zbek tili",
                index: 1,
              ),
              ScreenUtil().setVerticalSpacing(15),
              const ChooseButtonLang(
                langName: "Узбек тили",
                index: 3,
              ),
              ScreenUtil().setVerticalSpacing(15),
              const ChooseButtonLang(
                langName: "English",
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
