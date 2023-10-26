import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_animation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PayingByCardPage extends StatefulWidget {
  static const routeName = "/payingByCard";
  const PayingByCardPage({super.key});

  @override
  State<PayingByCardPage> createState() => _PayingByCardPageState();
}

class _PayingByCardPageState extends State<PayingByCardPage> {
  TextEditingController cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 15.w,
        ),
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ConstColor.mainWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ConfirmAnimationPage.routeName);
          },
          child: Container(
            alignment: Alignment.center,
            height: 35.h,
            width: 328.w,
            decoration: BoxDecoration(
                color: ConstColor.as_salomText,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              "Оформить заказ",
              style: Styles.buttonText,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: ConstColor.greyColor,
            height: 0.5,
            width: double.infinity,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Оформление заказа",
          style: Styles.appBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 15.w,
          right: 15.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "1) Пожалуйста, перечислите сумму заказа на карту:",
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(5),
              Text(
                "Сумма заказа: 1 290 000 сум",
                style: Styles.style500sp14Main,
              ),
              TextFormField(
                style: Styles.style400sp24Black,
                controller: cardController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      ConstIcons.card,
                      height: 35.h,
                    ),
                  ),
                  hintText: "card number",
                  hintStyle: Styles.style400sp24Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              const Divider(),
              ScreenUtil().setVerticalSpacing(20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "2) Отправьте скриншот оплаты нашему менеджеру:",
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Image.asset(
                      "assets/images/telegram.png",
                    ),
                  ),
                  ScreenUtil().setHorizontalSpacing(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@as-salom.support",
                        style: Styles.style400sp20Main,
                      ),
                      Text(
                        "+998 90 999 99 90",
                        style: Styles.styles500sp14Black,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              ScreenUtil().setVerticalSpacing(20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "3) Оставьте ваш номер телефона для подтверждения и обратной связи:",
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              Text(
                'Ваш номер телефона*',
                style: Styles.style400sp14Black,
              ),
              ScreenUtil().setVerticalSpacing(5),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "+998",
                  hintStyle: Styles.style400sp14Grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: ConstColor.lightGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
