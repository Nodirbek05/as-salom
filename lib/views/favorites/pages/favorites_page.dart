import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  static const routeName = "/favoritesPage";
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool isHome = true;
  String favBox = "favoritesBoxForHome";
  String basketBox = "basketBoxForHome";

  void getCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isHome = prefs.getInt("place") == 2;
    favBox =
        prefs.getInt('place') == 2 ? "favoritesBoxForHome" : "favoritesBox";
    basketBox = prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";
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
          valueListenable: Hive.box<FavoritesModel>(favBox).listenable(),
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
                      textAlign: TextAlign.center,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.64,
                  crossAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    fromApi: false,
                    product: ProductModel(
                        id: products[index].id,
                        discount: products[index].discount != "null"
                            ? int.parse(products[index].discount ?? "0")
                            : 0,
                        nameru: products[index].nameru,
                        nameen: products[index].nameen,
                        nameuz: products[index].nameuz,
                        descen: products[index].descen,
                        descru: products[index].descru,
                        descuz: products[index].descuz,
                        photo: [products[index].image ?? ""],
                        typegood: products[index].type,
                        price: products[index].price != "null"
                            ? int.parse(products[index].price ?? "0")
                            : 0,
                        slug: products[index].slug),
                    withHeight: false,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
