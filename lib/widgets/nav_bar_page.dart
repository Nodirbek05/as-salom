import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/product_detail/pages/product_detail.dart';
import 'package:flutter/material.dart';

class CustomNavigatonBar extends StatefulWidget {
  const CustomNavigatonBar({super.key});
  static const routeName = "/navBarPage";

  @override
  State<CustomNavigatonBar> createState() => _CustomNavigatonBarState();
}

class _CustomNavigatonBarState extends State<CustomNavigatonBar> {

    final List<Widget> screens =[
       MainPage(),

     const ProductDetailPage(),
       MainPage(),
       MainPage(),
       MainPage(),
    ];

   int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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