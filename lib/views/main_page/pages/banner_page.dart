import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/views/main_page/logic/get_all_banners_bloc/get_all_banners_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final PageController _pageController1 = PageController(viewportFraction: 1.0);

  @override
  void initState() {
    context.read<GetAllBannersBloc>().add(GetBannersDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBannersBloc, GetAllBannersState>(
      builder: (context, state) {
        if (state is GetAllBannersLoading) {
          return Center(
            child: shimmerWidget(),
          );
        } else if (state is GetAllBannersSucces) {
          final bannerData = state.allBanners;
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
                  itemCount: bannerData.data!.length,
                  itemBuilder: (context, index) {
                    print(bannerData.data![index].photo.toString());
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: Container(
                        height: 115.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                ApiPaths.imageUrl +
                                    bannerData.data![index].photo!.toString(),
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15.r),
                          // color: ConstColor.as_salomText,
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
                  count: bannerData.data!.length,
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
        return shimmerWidget();
      },
    );
  }

  Shimmer shimmerWidget() {
    return Shimmer.fromColors(
        baseColor: ConstColor.dotColor,
        highlightColor: ConstColor.lightGrey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              height: 140.h,
              child: PageView.builder(
                controller: _pageController1,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
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
                        color: ConstColor.dotColor,
                        borderRadius: BorderRadius.circular(15.r),
                        // color: ConstColor.as_salomText,
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
                count: 2,
                effect: WormEffect(
                  dotColor: ConstColor.dotColor,
                  activeDotColor: ConstColor.dotColor,
                  dotHeight: ScreenUtil().setWidth(10.0),
                  dotWidth: ScreenUtil().setWidth(10.0),
                ),
              ),
            ),

            ScreenUtil().setVerticalSpacing(30),
          ],
        ),
      );
  }
}
