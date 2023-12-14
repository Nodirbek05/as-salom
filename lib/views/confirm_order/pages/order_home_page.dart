import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHomePage extends StatelessWidget {
  OrderHomePage({super.key});

  TextEditingController homeController = TextEditingController();
  TextEditingController etajController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  TextEditingController podezdController = TextEditingController();
  TextEditingController kvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Адрес доставки",
            style: Styles.styles700sp16Black,
          ),
          ScreenUtil().setVerticalSpacing(10),
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ConstColor.as_salomText,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
          ),
          ScreenUtil().setVerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: homeController,
                  decoration: InputDecoration(
                    hintText: "Дом",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: etajController,
                  decoration: InputDecoration(
                    hintText: "Этаж",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ScreenUtil().setVerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: podezdController,
                  decoration: InputDecoration(
                    hintText: "Подъезд",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: kvController,
                  decoration: InputDecoration(
                    hintText: "Квартира",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ScreenUtil().setVerticalSpacing(20),
          Text(
            "comments".tr(),
            style: Styles.style400sp14Black,
          ),
          TextFormField(
            maxLines: 5,
            controller: commentController,
            decoration: InputDecoration(
              hintText: "Comments...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
