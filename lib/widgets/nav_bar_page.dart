import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/views/basket/basket_page.dart';
import 'package:assalomproject/views/drawer/pages/drawer_page.dart';
import 'package:assalomproject/views/favorites/pages/favorites_page.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigatonBar extends StatefulWidget {
  const CustomNavigatonBar({super.key});
  static const routeName = "/navBarPage";

  @override
  State<CustomNavigatonBar> createState() => _CustomNavigatonBarState();
}

class _CustomNavigatonBarState extends State<CustomNavigatonBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Widget> screens = [
    MainPage(),
    const FavoritesPage(),
    const DrawerPage(),
    const ProfilePage(),
    const BasketPage(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    index == 2
        ? _scaffoldKey.currentState!.openDrawer()
        : setState(() {
            _selectedIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: ConstColor.mainWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: const [
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Home'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Business'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('School'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ConstColor.greyColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
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
