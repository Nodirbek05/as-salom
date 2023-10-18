import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/mainPage";

  MainPage({super.key});

  final PageController _pageController1 = PageController(viewportFraction: 1.0);

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
            )),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            height: 140.h,
            child: PageView.builder(
              controller: _pageController1,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Container(
                    height: 115.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ConstColor.as_salomText,
                    ),
                  ),
                );
              },
            ),
          ),
          ScreenUtil().setVerticalSpacing(6),
          //! DOTS ARE HERE
          Container(
            margin: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
            ),
            alignment: Alignment.bottomCenter,
            height: 4.h,
            child: SmoothPageIndicator(
              controller: _pageController1,
              count: 5,
              effect: WormEffect(
                dotColor: ConstColor.dotColor,
                activeDotColor: ConstColor.as_salomText,
                dotHeight: ScreenUtil().setWidth(10.0),
                dotWidth: ScreenUtil().setWidth(10.0),
              ),
            ),
          ),

          ScreenUtil().setVerticalSpacing(30),

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
          )
        ],
      ),
    );
  }
}
