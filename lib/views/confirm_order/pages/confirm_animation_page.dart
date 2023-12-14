import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmAnimationPage extends StatefulWidget {
  static const routeName = "/confirmAnimation";
  const ConfirmAnimationPage({super.key});

  @override
  State<ConfirmAnimationPage> createState() => _ConfirmAnimationPageState();
}

class _ConfirmAnimationPageState extends State<ConfirmAnimationPage> {
  bool isHome = true;

  
  String basketBox = "basketBoxForHome";

  void getCache() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    isHome = _prefs.getInt("place") == 2;
    basketBox = _prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";

    setState(() {});
  }

  @override
  void initState() {
    getCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: Image.asset(
                "assets/images/done.png",
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            SizedBox(
              width: 310.w,
              child: Text(
                "confirm_info".tr(),
                textAlign: TextAlign.center,
                style: Styles.style600sp20Black,
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            SizedBox(
              width: 310.w,
              child: Text(
                "check_status".tr(),
                textAlign: TextAlign.center,
                style: Styles.style400sp16Black,
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CustomNavigatonBar.routeName);
                Hive.box<BasketModel>(basketBox).clear();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 328.w,
                decoration: BoxDecoration(
                    color: ConstColor.as_salomText,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "main_page".tr(),
                  style: Styles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
