import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        // height:96.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          height:50.h,
          width: 328.w,
          decoration: BoxDecoration(
            color: ConstColor.as_salomText,
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: Text("Получить код",
          style: Styles.buttonText,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        iconTheme: const IconThemeData(color: ConstColor.mainBlack),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Регистрация",
                style: Styles.registerText,
                ),

                Container(
                  height: 19.h,
                  width: 2.w,
                  color: ConstColor.mainBlack,
                ),

                 Text("Вход в аккаунт",
                style: Styles.greyRegister,
                ),

              ],
            ),
            ScreenUtil().setVerticalSpacing(20),

            Text("Ваше имя",
            style: Styles.nameInputText,
            ),
            ScreenUtil().setVerticalSpacing(4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Введите ваше имя',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),

              ),
            ),

             ScreenUtil().setVerticalSpacing(20),
            Text("Номер телефона",
            style: Styles.nameInputText,
            ),
            ScreenUtil().setVerticalSpacing(4),
            TextFormField(
              decoration: InputDecoration(
                hintText: '+998',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}