import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/pages/basket_page.dart';
import 'package:assalomproject/views/drawer/pages/drawer_page.dart';
import 'package:assalomproject/views/favorites/pages/favorites_page.dart';
import 'package:assalomproject/views/inside_category/pages/inside_cat_first_page.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/views/main_page/logic/search_bloc/search_bloc.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class CustomNavigatonBar extends StatefulWidget {
  const CustomNavigatonBar({super.key});
  static const routeName = "/navBarPage";

  @override
  State<CustomNavigatonBar> createState() => _CustomNavigatonBarState();
}

class _CustomNavigatonBarState extends State<CustomNavigatonBar> {
  @override
  void initState() {
    context.read<GetAllCategoriesBloc>().add(GetCategories());
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    ),
    BlocProvider(
      create: (context) => CreateOrderBloc(),
      child: BasketPage(),
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

  final basketBox = Hive.box<BasketModel>('basketBox');

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
                  top: 30.h,
                ),
                child: ListView.builder(
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, InsideCatFirstPage.routeName,
                            arguments: InsideCatFirstPage(
                                id: int.parse(
                                    categoryData[index].id!.toString()),
                                name: categoryData[index].name_ru!));
                      },
                      leading: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.network(
                          ApiPaths.imageUrl + categoryData[index].photo!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(categoryData[index].name_ru!),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    );
                  },
                ),
              ),
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
        backgroundColor: ConstColor.mainWhite,
        unselectedItemColor: ConstColor.greyColor,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              child: Stack(
                children: [
                  const Icon(Icons.shopping_cart_sharp),
                  ValueListenableBuilder<Box<BasketModel>>(
                    valueListenable:
                        Hive.box<BasketModel>('basketBox').listenable(),
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
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ConstColor.as_salomText,
        onTap: _onItemTapped,
      ),
    );
  }
}
