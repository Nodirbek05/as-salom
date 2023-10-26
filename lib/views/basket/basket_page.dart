import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BasketPage extends StatelessWidget {
  static const routeName = "/basketPage";
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        child: Column(
          children: [
            Text(
              "Итого к оплате:50 000 сум",
              style: Styles.style600sp18Black,
            ),
            ScreenUtil().setVerticalSpacing(5),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: ConstColor.mainWhite,
                      insetPadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      // title: const Text('Basic dialog title'),
                      content: Container(
                        // color: ConstColor.mainWhite,
                        height: 500.h,
                        width: 350.w,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Состав заказа:",
                                  style: Styles.style600sp18Black,
                                ),
                                const Spacer(),
                                InkWell(
                                  radius: 30.r,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: SvgPicture.asset(
                                    ConstIcons.xbutton,
                                    height: 20.h,
                                  ),
                                ),
                              ],
                            ),
                            ScreenUtil().setVerticalSpacing(15.h),
                            SizedBox(
                              height: 350.h,
                              child: ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 10.h,
                                    ),
                                    height: 40.h,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: ConstColor.greyColor,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Coca-Cola 1.5 л",
                                          style: Styles.style400sp14Black,
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "х2",
                                              style: Styles.style400sp14Grey,
                                            ),
                                            ScreenUtil()
                                                .setHorizontalSpacing(10),
                                            Text(
                                              "25 000 сум",
                                              style: Styles.style400sp14Black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 10.h,
                                    ),
                                    height: 40.h,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: ConstColor.greyColor,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Coca-Cola 1.5 л",
                                          style: Styles.style400sp14Black,
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "х2",
                                              style: Styles.style400sp14Grey,
                                            ),
                                            ScreenUtil()
                                                .setHorizontalSpacing(10),
                                            Text(
                                              "25 000 сум",
                                              style: Styles.style400sp14Black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "*Оплаченный заказ отмене не подлежит",
                              style: Styles.style400sp14Red,
                            ),
                            ScreenUtil().setVerticalSpacing(10),
                            InkWell(
                              radius: 50.r,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ChoosePaymentPage.routeName,
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.h,
                                width: 328.w,
                                decoration: BoxDecoration(
                                    color: ConstColor.as_salomText,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Text(
                                  "Подтвердить",
                                  style: Styles.buttonText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.h,
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
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Корзина", style: Styles.appBarText),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 15.w,
          right: 15.w,
        ),
        child: SizedBox(
          height: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 150.h,
                width: 328.w,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ConstColor.dotColor),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ConstIcons.delete,
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ConstColor.dotColor,
                          ),
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Мужской свитер вязаный...",
                              style: Styles.style500sp14Black,
                            ),
                            Text(
                              "Размер:  XL(52-54)",
                              style: Styles.style400sp13Grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(30),
                    Row(
                      children: [
                        Text(
                          "1 150 000 сум",
                          style: Styles.style600sp14Main,
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: ConstColor.dotColor,
                            ),
                          ),
                          child: Text(
                            "-",
                            style: Styles.style400sp14Black,
                          ),
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        const Text("23"),
                        ScreenUtil().setHorizontalSpacing(10),
                        Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: ConstColor.dotColor,
                            ),
                          ),
                          child: Text(
                            "+",
                            style: Styles.style400sp14Black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ScreenUtil().setVerticalSpacing(15.h),
              Container(
                height: 150.h,
                width: 328.w,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ConstColor.dotColor),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ConstIcons.delete,
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ConstColor.dotColor,
                          ),
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Мужской свитер вязаный...",
                              style: Styles.style500sp14Black,
                            ),
                            Text(
                              "Размер:  XL(52-54)",
                              style: Styles.style400sp13Grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(30),
                    Row(
                      children: [
                        Text(
                          "1 150 000 сум",
                          style: Styles.style600sp14Main,
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: ConstColor.dotColor,
                            ),
                          ),
                          child: Text(
                            "-",
                            style: Styles.style400sp14Black,
                          ),
                        ),
                        ScreenUtil().setHorizontalSpacing(10),
                        const Text("23"),
                        ScreenUtil().setHorizontalSpacing(10),
                        Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: ConstColor.dotColor,
                            ),
                          ),
                          child: Text(
                            "+",
                            style: Styles.style400sp14Black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
