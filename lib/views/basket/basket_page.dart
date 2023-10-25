import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
   static const routeName = "/basketPage";
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Корзина",
          style: Styles.appBarText
        ),
      ),
    );
  }
}