import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/confirm_order/pages/paying_by_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePaymentPage extends StatefulWidget {
  static const routeName = "/choosePayment";
  const ChoosePaymentPage({super.key});

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController commentController = TextEditingController();
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
            Navigator.pushNamed(context, PayingByCardPage.routeName);
          },
          child: Container(
            alignment: Alignment.center,
            height: 35.h,
            width: 328.w,
            decoration: BoxDecoration(
                color: ConstColor.as_salomText,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              "Оплатить заказ",
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
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: ConstColor.mainBlack,
        ),
        centerTitle: true,
        backgroundColor: ConstColor.mainWhite,
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
              Text(
                'Ф.И.О получателя*',
                style: Styles.style400sp14Black,
              ),
              InputWidget(
                hintText: "Введите И.Ф.О",
                controller: nameController,
              ),
              ScreenUtil().setVerticalSpacing(20),
              Text(
                'Способ оплаты*',
                style: Styles.style400sp14Black,
              ),
              ScreenUtil().setVerticalSpacing(10),
              ...List.generate(
                3,
                (index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    height: 64.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: ConstColor.lightGrey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: ConstColor.lightGrey,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: ConstColor.as_salomText,
                          ),
                        ),
                        ScreenUtil().setHorizontalSpacing(5.w),
                        SizedBox(
                          height: 32.h,
                          width: 85.w,
                          child: Image.asset(
                            "assets/images/click.png",
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                "Комментарий к заказу (необязательно)",
                style: Styles.style400sp14Black,
              ),
              InputWidget(
                controller: commentController,
                maxLines: 8,
                hintText: 'Введите текст...',
              ),
              ScreenUtil().setVerticalSpacing(30)
            ],
          ),
        ),
      ),
    );
  }
}
