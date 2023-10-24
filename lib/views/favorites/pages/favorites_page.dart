import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = "/favoritesPage";
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Избранное",
          style: Styles.appBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GridView.builder(
            // padding: EdgeInsets.only(
            //   left: 20,
            //   // right: 15.w,
            // ),
            gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
               mainAxisSpacing: 10,
               childAspectRatio: 0.64,
              //  mainAxisExtent: 300,
                crossAxisSpacing: 10,
                ),
                itemCount: 10,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                index: index,
                withHeight: false,
                
              );
            },
          ),
        ),
      ),
    );
  }
}
