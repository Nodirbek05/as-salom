import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonWidget extends StatelessWidget {
  final String text;
  final bool textStyle;
  final VoidCallback onTap;
  final double width;
  final double? height;
  const MainButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width,
      required this.textStyle,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
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
          style:
              textStyle == true ? Styles.buttonText : Styles.style700sp13White,
        ),
      ),
    );
  }
}
