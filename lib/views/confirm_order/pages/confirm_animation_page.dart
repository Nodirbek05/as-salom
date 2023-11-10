import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/profile/pages/profile_page.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmAnimationPage extends StatelessWidget {
  static const routeName = "/confirmAnimation";
  const ConfirmAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: Image.asset(
                "assets/images/done.png",
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            SizedBox(
              width: 310.w,
              child: Text(
                "Ваш заказ успешно оформлен и будет доставленв течение 1 - 3 суток",
                textAlign: TextAlign.center,
                style: Styles.style600sp20Black,
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            SizedBox(
              width: 310.w,
              child: Text(
                "Вы можете отслеживать его статус в личном профиле",
                textAlign: TextAlign.center,
                style: Styles.style400sp16Black,
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CustomNavigatonBar.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 328.w,
                decoration: BoxDecoration(
                    color: ConstColor.as_salomText,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "Личный профиль",
                  style: Styles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
