import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BasketPage extends StatelessWidget {
  static const routeName = "/basketPage";
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   height: 80.h,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(10.r),
      //       topRight: Radius.circular(10.r),
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       Text(
      //         "Итого к оплате:50 000 сум",
      //         style: Styles.style600sp18Black,
      //       ),
      //       ScreenUtil().setVerticalSpacing(5),
      //       Container(
      //         alignment: Alignment.center,
      //         height: 45.h,
      //         width: 328.w,
      //         decoration: BoxDecoration(
      //             color: ConstColor.as_salomText,
      //             borderRadius: BorderRadius.circular(50.r)),
      //         child: Text(
      //           "Оформить заказ",
      //           style: Styles.buttonText,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
