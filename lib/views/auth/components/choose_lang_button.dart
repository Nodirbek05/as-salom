import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseButtonLang extends StatelessWidget {
  const ChooseButtonLang({super.key, required this.langName});
  final String langName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const RegistrationPage();
              },
            ),
          );
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
          langName,
          style: Styles.chooseLangColor,
        ),
      ),
    );
  }
}
