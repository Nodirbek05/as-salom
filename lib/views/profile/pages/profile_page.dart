import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/data/models/model_for_update.dart';
import 'package:assalomproject/views/profile/pages/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    context.read<GetUserProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColor.mainWhite,
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
            BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
              builder: (context, state) {
                print(state);
                if (state is GetUserProfileSuccess) {
                  print(state.profilData.data.name.toString());
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 70.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 58.r,
                          backgroundColor: ConstColor.dotColor,
                          child: Icon(
                            Icons.person_outline_outlined,
                            size: 70,
                            color: ConstColor.mainBlack.withOpacity(.7),
                          ),
                        ),
                        ScreenUtil().setVerticalSpacing(25.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              UpdateUserDataPage.routeName,
                              arguments: ModelForUpdate(
                                name: state.profilData.data.name.toString(),
                                part: "Имя",
                                phone: state.profilData.data.phone.toString(),
                                userId: state.profilData.data.id,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.profilData.data.name.toString(),
                                style: Styles.styles700sp20Black,
                              ),
                              SvgPicture.asset(
                                ConstIcons.pensil,
                              ),
                            ],
                          ),
                        ),
                        ScreenUtil().setVerticalSpacing(25.h),
                        Text(
                          "Номер телефона",
                          style: Styles.style600sp14Black,
                        ),
                        ScreenUtil().setVerticalSpacing(10.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              UpdateUserDataPage.routeName,
                              arguments: ModelForUpdate(
                                name: state.profilData.data.name.toString(),
                                part: "Номер",
                                phone: state.profilData.data.phone.toString(),
                                userId: state.profilData.data.id,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.profilData.data.phone.toString(),
                                style: Styles.styles700sp20Black,
                              ),
                              SvgPicture.asset(
                                ConstIcons.pensil,
                              ),
                            ],
                          ),
                        ),
                        ScreenUtil().setVerticalSpacing(25.h),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30)),
                              ),
                              builder: (parentContext) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    decoration: const BoxDecoration(
                                      color: ConstColor.mainWhite,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                    ),
                                    width: double.infinity,
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Вы уверены, что хотите выйти из профиль?",
                                          style: Styles.style700sp22Main,
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color:
                                                        ConstColor.as_salomText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                width: 150,
                                                height: 50,
                                                child: Text(
                                                  "No",
                                                  style:
                                                      Styles.style600sp20White,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                SharedPreferences preferences =
                                                    await SharedPreferences
                                                        .getInstance();
                                                await preferences.clear();
                                                // ignore: use_build_context_synchronously
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        SplashScreen.routeName,
                                                        (route) => false);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: ConstColor.greyColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                width: 150,
                                                height: 50,
                                                child: Text(
                                                  "Yes",
                                                  style:
                                                      Styles.style600sp20White,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
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
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
