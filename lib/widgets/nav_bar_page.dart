import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/pages/basket_page.dart';
import 'package:assalomproject/views/drawer/pages/drawer_page.dart';
import 'package:assalomproject/views/favorites/pages/favorites_page.dart';
import 'package:assalomproject/views/inside_category/pages/inside_category_page.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/views/main_page/logic/search_bloc/search_bloc.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/pages/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavigatonBar extends StatefulWidget {
  const CustomNavigatonBar({super.key});
  static const routeName = "/navBarPage";

  @override
  State<CustomNavigatonBar> createState() => _CustomNavigatonBarState();
}

class _CustomNavigatonBarState extends State<CustomNavigatonBar> {
  @override
  void initState() {
    getCache();
    context.read<GetAllCategoriesBloc>().add(GetCategories());
    super.initState();
  }

  late bool isHome;
  bool hasToken = false;

  String basketBox = "basketBoxForHome";

  void getCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isHome = prefs.getInt("place") == 2;
    hasToken = prefs.getString('token') != null;
    basketBox = prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";
    // setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> screens = [
    BlocProvider(
      create: (context) => SearchBloc(),
      child: const MainPage(),
    ),
    const FavoritesPage(),
    const DrawerPage(),
   BlocProvider(
            create: (context) => GetUserProfileBloc(),
            child: const ProfilePage(),
          )
        ,
    BlocProvider(
      create: (context) => CreateOrderBloc(),
      child: const BasketPage(
        canBack: false,
      ),
    ),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    index == 2
        ? _scaffoldKey.currentState!.openDrawer()
        : setState(() {
            _selectedIndex = index;
          });
  }

  // final basketBox = Hive.box<BasketModel>('basketBox');

  String _getcategoryByLocale(CategoryDataModel category, Locale locale) {
    String categoryName = "no_data".tr();
    if (locale == const Locale('ru')) {
      categoryName = category.nameru ?? "";
    } else if (locale == const Locale('uz')) {
      categoryName = category.nameuz ?? "";
    } else if (locale == const Locale('en')) {
      categoryName = category.nameen ?? "";
    } else if (locale == const Locale('fr')) {
      categoryName = category.nameoz ?? "";
    }
    return categoryName;
  }

  @override
  Widget build(BuildContext context) {
    // final product = basketBox.values.toList().cast<BasketModel>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        builder: (context, state) {
          if (state is GetAllCategoriesInitial) {
            return const Drawer(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else if (state is GetAllCategoriesSuccess) {
            final categoryData = state.categoryModel.data;
            return Drawer(
              backgroundColor: ConstColor.mainWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 50.h,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // print(_prefs.getInt('place'));

                          isHome
                              ? await prefs.setInt('place', 1)
                              : await prefs.setInt('place', 2);
                          // print(prefs.getInt('place'));

                          // ignore: use_build_context_synchronously
                          Navigator.pushNamedAndRemoveUntil(context,
                              CustomNavigatonBar.routeName, (route) => false);
                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: isHome
                                ? SvgPicture.asset(
                                    ConstIcons.equal,
                                    color: ConstColor.mainBlack,
                                  )
                                : SvgPicture.asset(
                                    ConstIcons.house,
                                    color: ConstColor.mainBlack,
                                  )),
                        title: Text(
                          isHome ? "to_zone".tr() : "to_home".tr(),
                          style: Styles.style500sp14Black,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ...List.generate(
                        categoryData.length,
                        (index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, InsideCategoryPage.routeName,
                                  arguments: InsideCategoryPage(
                                    isCat: true,
                                    id: int.parse(
                                        categoryData[index].id!.toString()),
                                    name: _getcategoryByLocale(
                                      categoryData[index],
                                      context.locale,
                                    ),
                                  ));
                            },
                            leading: SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: SvgPicture.network(
                                ApiPaths.imageUrl + categoryData[index].icon!,
                                color: ConstColor.mainBlack,
                              ),
                            ),
                            title: Text(
                              _getcategoryByLocale(
                                categoryData[index],
                                context.locale,
                              ),
                              style: Styles.style500sp14Black,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          );
                        },
                      )
                    ],
                  )),
            );
          }
          return const Drawer(
            child: Center(
              child: Text("NO Data"),
            ),
          );
        },
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ConstColor.mainWhite,
        unselectedItemColor: ConstColor.greyColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            label: 'favorites'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: 'menu'.tr(),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(Icons.person)
                : const Icon(Icons.person_2_outlined),
            label: 'profile'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              child: Stack(
                children: [
                  _selectedIndex == 4
                      ? const Icon(Icons.shopping_cart_sharp)
                      : const Icon(Icons.shopping_cart_outlined),
                  ValueListenableBuilder<Box<BasketModel>>(
                    valueListenable:
                        Hive.box<BasketModel>(basketBox).listenable(),
                    builder: (ctx, box, index) {
                      final products = box.values.toList().cast<BasketModel>();
                      if (products.isEmpty) {
                        return const SizedBox();
                      } else {
                        return Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: ConstColor.bascketCountColo,
                            radius: 8,
                            child: Text(
                              products.length.toString(),
                              style: Styles.style400sp12White,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            label: 'cart'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ConstColor.assalomText,
        onTap: _onItemTapped,
      ),
    );
  }
}
