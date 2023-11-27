import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          "favorites".tr(),
          style: Styles.appBarText,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<FavoritesModel>("favoritesBox").listenable(),
              builder: (ctx, box, _) {
                final products = box.values.toList().cast<FavoritesModel>();
                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScreenUtil().setVerticalSpacing(200),
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/favorites.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text(
                          "empty_fav".tr(),
                          style: Styles.style600sp18Black,
                        ),
                        ScreenUtil().setVerticalSpacing(20),
                        Text(
                          "add_fav".tr(),
                          style: Styles.style400sp16Black,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: GridView.builder(
                    // padding: EdgeInsets.only(
                    //   left: 20,
                    //   // right: 15.w,
                    // ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.64,
                      //  mainAxisExtent: 300,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCardWidget(
                        product: ProductModel(
                          id: products[index].id,
                          discount: products[index].discount,
                          name_ru: products[index].name,
                          photo: [products[index].image],
                          type_good: products[index].type,
                          price: products[index].price,
                        ),
                        withHeight: false,
                      );
                    },
                  ),
                );
              })),
    );
  }
}
