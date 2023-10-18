import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double? height;
  const MainButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.h,
        width: width,
        decoration: BoxDecoration(
            color: ConstColor.as_salomText,
            borderRadius: BorderRadius.circular(50.r)),
        child: Text(
          text,
          style: Styles.buttonText,
        ),
      ),
    );
  }
}
