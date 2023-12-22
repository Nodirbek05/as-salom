import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseButtonLang extends StatefulWidget {
  const ChooseButtonLang(
      {super.key, required this.langName, required this.index});
  final String langName;
  final int index;

  @override
  State<ChooseButtonLang> createState() => _ChooseButtonLangState();
}

class _ChooseButtonLangState extends State<ChooseButtonLang> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        if (widget.index == 0) {
          context.setLocale(const Locale("ru"));
          print('Current Locale: ${context.locale}');
          print('Translation: ${tr("registration")}');
          Navigator.pushNamed(context, RegistrationPage.routeName);
        } else if (widget.index == 1) {
          context.setLocale(const Locale("uz"));

          Navigator.pushNamed(context, RegistrationPage.routeName);
        } else if(widget.index == 2) {
          context.setLocale(const Locale("en"));
          Navigator.pushNamed(context, RegistrationPage.routeName);
        } else if (widget.index == 3) {
                context.setLocale(const Locale("uzk"));
          Navigator.pushNamed(context, RegistrationPage.routeName);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 328.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: ConstColor.as_salomText,
          ),
        ),
        child: Text(
          widget.langName,
          style: Styles.chooseLangColor,
        ),
      ),
    );
  }
}
