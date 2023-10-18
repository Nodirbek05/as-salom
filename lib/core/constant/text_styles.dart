import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles{
  static const interFontFamily = "Inter";
  //! Weight 700
  static final tooBoldtext60 = TextStyle(
    color: ConstColor.mainWhite,
    fontSize: 60.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

   static final asSalomText = TextStyle(
    color: ConstColor.as_salomText,
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

  static final chooseText = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

  static final chooseLangColor = TextStyle(
    color: ConstColor.as_salomText,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

   static final buttonText = TextStyle(
    color: ConstColor.mainWhite,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

  static final registerText = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: interFontFamily,
  );


  static final greyRegister = TextStyle(
    color: ConstColor.greyColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: interFontFamily,
  );

   static final nameInputText = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    fontFamily: interFontFamily,
  );
}