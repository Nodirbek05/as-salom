import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/data_const_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/data/logic/login_bloc/login_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/registration_bloc/register_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/verification_bloc/verification_bloc.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:assalomproject/views/profile/data/logic/get_orders_bloc/get_orders_bloc.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/pages/orders_tab_page.dart';
import 'package:assalomproject/views/profile/pages/profile_tab_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profilePage";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  static List<Tab> myTabs = DataConst.tabs
      .map((e) => Tab(
            child: Text(
              e,
              textAlign: TextAlign.center,
            ),
          ))
      .toList();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    getCache();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  bool? hasToken;

  void getCache() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    hasToken = _prefs.getString('token') != null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: myTabs.length,
        child: hasToken == null
            ? const Center()
            : hasToken!
                ? Scaffold(
                    appBar: AppBar(
                      backgroundColor: ConstColor.mainWhite,
                      bottom: TabBar(
                        labelColor: ConstColor.as_salomText,
                        indicatorColor: ConstColor.as_salomText,
                        tabs: myTabs,
                      ),
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      title: Text(
                        "profile".tr(),
                        style: Styles.appBarText,
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        BlocProvider(
                          create: (context) => GetOrdersBloc(),
                          child: const OrdersPage(),
                        ),
                        BlocProvider(
                          create: (context) => GetUserProfileBloc(),
                          child: const ProfileTabPage(),
                        )
                      ],
                    ),
                  )
                : MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => LoginBloc(),
                      ),
                      BlocProvider(
                        create: (context) => VerificationBloc(),
                      ),
                      BlocProvider(
                        create: (context) => RegisterBloc(),
                      ),
                    ],
                    child: const RegistrationPage(),
                  ));
  }
}
