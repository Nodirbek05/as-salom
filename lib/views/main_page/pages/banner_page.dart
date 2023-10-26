import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final PageController _pageController1 = PageController(viewportFraction: 1.0);
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
