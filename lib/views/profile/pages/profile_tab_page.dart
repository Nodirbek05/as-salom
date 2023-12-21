import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/data/models/model_for_update.dart';
import 'package:assalomproject/views/profile/pages/update_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
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
                  "phone_number".tr(),
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
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      builder: (parentContext) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: const BoxDecoration(
                              color: ConstColor.mainWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            width: double.infinity,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "log_out_desc".tr(),
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
                                            color: ConstColor.as_salomText,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: 120,
                                        height: 50,
                                        child: Text(
                                          "no".tr(),
                                          style: Styles.style600sp20White,
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
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            SplashScreen.routeName,
                                            (route) => false);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ConstColor.greyColor,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: 120,
                                        height: 50,
                                        child: Text(
                                          "yes".tr(),
                                          style: Styles.style600sp20White,
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
                      'log_out'.tr(),
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
    );
  }
}
