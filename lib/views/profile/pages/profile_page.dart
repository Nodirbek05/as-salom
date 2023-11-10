import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/profile/data/logic/get_orders_bloc/get_orders_bloc.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/pages/orders_tab_page.dart';
import 'package:assalomproject/views/profile/pages/profile_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocProvider(
              create: (context) => GetOrdersBloc(),
              child: OrdersPage(),
            ),
            BlocProvider(
              create: (context) => GetUserProfileBloc(),
              child: const ProfileTabPage(),
            )
          ],
        ),
      ),
    );
  }
}
