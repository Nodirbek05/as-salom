import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/logic/get_all_banners_bloc/get_all_banners_bloc.dart';
import 'package:assalomproject/views/main_page/pages/banner_page.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/mainPage";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: ConstColor.greyColor,
            height: 0.5,
            width: double.infinity,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: 50.h,
          width: 400.w,
          padding: EdgeInsets.only(
            // top: 30.h,
            left: 15.w,
            right: 15.w,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: 5.h,
                left: 15.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: ConstColor.greyColor,
                  width: 0.0,
                ),
              ),
              focusColor: ConstColor.greyColor,
              hintText: "Поиск товаров",
              hintStyle: Styles.styles400sp14Black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              suffixIcon: Container(
                width: 72.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: ConstColor.as_salomText,
                  borderRadius: BorderRadius.circular(
                    30.r,
                  ),
                ),
                child: Icon(
                  Icons.search,
                  color: ConstColor.mainWhite,
                  size: 30.h,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => GetAllBannersBloc(),
              child: const BannerPage(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                bottom: 15.h,
              ),
              child: Text(
                "Категории товаров",
                style: Styles.styles700sp20Black,
              ),
            ),
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                    ),
                    child: Container(
                      // margin: EdgeInsets.only(

                      //   right: 5.w,
                      // ),
                      height: 123.h,
                      width: 127.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ConstColor.as_salomText,
                      ),
                    ),
                  );
                },
              ),
            ),
            ScreenUtil().setVerticalSpacing(18.h),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                bottom: 15.h,
              ),
              child: Text(
                "Вам понравится",
                style: Styles.styles700sp20Black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: SizedBox(
                height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: ProductCardWidget(
                          index: index, withHeight: true, height: 300.h),
                    );
                  },
                ),
              ),
            ),
            ScreenUtil().setVerticalSpacing(100)
          ],
        ),
      ),
    );
  }
}
