import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles{
  static const interFontFamily = "Inter";
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

   static final style400sp16Main = TextStyle(
    color: ConstColor.as_salomText,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: interFontFamily,
  );

   static final style600sp14Main = TextStyle(
    color: ConstColor.as_salomText,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: interFontFamily,
  );

  static final chooseText = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
  );

   static final style400sp12GreyUnderline = TextStyle(
    color: ConstColor.greyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: interFontFamily,
    decoration: TextDecoration.lineThrough
  );

   static final styles400sp16Black = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
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

static final style500sp16Black = TextStyle(
    color: ConstColor.mainBlack,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
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