import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profilePage";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "Мои заказы",
    ),
    Tab(text: 'Личные данные'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              labelColor: ConstColor.as_salomText,
              indicatorColor: ConstColor.as_salomText,
              tabs: myTabs),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Profile",
            style: Styles.appBarText,
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
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
                      width: double.infinity,
                      height: 249.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: ConstColor.dotColor),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: ConstColor.dotColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "Номер заказа: 123456",
                              style: Styles.style500sp14Black,
                            ),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Статус:",
                                  style: Styles.style500sp14Black,
                                ),
                                ScreenUtil().setHorizontalSpacing(5),
                                Container(
                                  alignment: Alignment.center,
                                  height: 25.h,
                                  width: 118.w,
                                  decoration: BoxDecoration(
                                    color: ConstColor.dotColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    "В обработке",
                                    style: Styles.style500sp12Grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Text("Дата оформления:26.09.2023 16:23",
                                style: Styles.style500sp14Black),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Text(
                              "Сумма заказа: 350 000 сум",
                              style: Styles.style500sp14Black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15.h,
                                ),
                                alignment: Alignment.center,
                                height: 43.h,
                                width: 296.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: ConstColor.as_salomText,
                                  ),
                                ),
                                child: Text(
                                  "Подробнее",
                                  style: Styles.style700sp16Main,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(20.h),
                    Container(
                      width: double.infinity,
                      height: 249.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: ConstColor.dotColor),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: ConstColor.dotColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "Номер заказа: 123456",
                              style: Styles.style500sp14Black,
                            ),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Статус:",
                                  style: Styles.style500sp14Black,
                                ),
                                ScreenUtil().setHorizontalSpacing(5),
                                Container(
                                  alignment: Alignment.center,
                                  height: 25.h,
                                  width: 118.w,
                                  decoration: BoxDecoration(
                                    color: ConstColor.as_salomText,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    "В пути",
                                    style: Styles.style500sp12White,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Text("Дата оформления:26.09.2023 16:23",
                                style: Styles.style500sp14Black),
                          ),
                          ScreenUtil().setVerticalSpacing(20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Text(
                              "Сумма заказа: 350 000 сум",
                              style: Styles.style500sp14Black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15.h,
                                ),
                                alignment: Alignment.center,
                                height: 43.h,
                                width: 296.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: ConstColor.as_salomText,
                                  ),
                                ),
                                child: Text(
                                  "Подробнее",
                                  style: Styles.style700sp16Main,
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
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 58.r,
                    backgroundColor: ConstColor.dotColor,
                  ),
                  ScreenUtil().setVerticalSpacing(
                    25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Жалолов Жалоллиддин",
                        style: Styles.styles700sp20Black,
                      ),
                      SvgPicture.asset(
                        ConstIcons.pensil,
                      ),
                    ],
                  ),
                  ScreenUtil().setVerticalSpacing(25.h),
                  Text(
                    "Номер телефона",
                    style: Styles.style600sp14Black,
                  ),
                  ScreenUtil().setVerticalSpacing(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+998 93 002 57 27",
                        style: Styles.styles700sp20Black,
                      ),
                      SvgPicture.asset(
                        ConstIcons.pensil,
                      ),
                    ],
                  ),
                  ScreenUtil().setVerticalSpacing(25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30.r,
                            ),
                            color: ConstColor.dotColor),
                        child: Text(
                          'Выйти с аккаута',
                          style: Styles.style600sp14Black,
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
    );
  }
}
