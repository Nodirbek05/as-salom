import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/number_formater.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasketProductCardWidget extends StatefulWidget {
  final BasketModel product;
  final VoidCallback onTap;
  final int price;
  const BasketProductCardWidget(
      {super.key,
      required this.onTap,
      required this.product,
      required this.price});

  @override
  State<BasketProductCardWidget> createState() =>
      _BasketProductCardWidgetState();
}

class _BasketProductCardWidgetState extends State<BasketProductCardWidget> {
  bool isHome = true;
  String favBox = "favoritesBoxForHome";
  String basketBox = "basketBoxForHome";

  void getCache() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    isHome = _prefs.getInt("place") == 2;
    favBox =
        _prefs.getInt('place') == 2 ? "favoritesBoxForHome" : "favoritesBox";
    basketBox = _prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";
    setState(() {});
  }

  @override
  void initState() {
    getCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ConstColor.dotColor),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    widget.onTap();
                    deleteDrugFromBasket(widget.product.id);
                  },
                  child: SvgPicture.asset(
                    ConstIcons.delete,
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiPaths.imageUrl + widget.product.image),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.r),
                    color: ConstColor.dotColor,
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        widget.product.name,
                        style: Styles.style500sp14Black,
                      ),
                    ),
                    // Text(
                    //   widget.product.type,
                    //   style: Styles.style400sp13Grey,
                    // ),
                  ],
                ),
              ],
            ),
            ScreenUtil().setVerticalSpacing(30),
            Row(
              children: [
                Text(
                  "${NumberFormatter.currency(widget.price)} ${"sum".tr()}",
                  style: Styles.style600sp14Main,
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(25.r),
                  onTap: () {
                    widget.onTap();

                    setState(() {
                      int.parse(widget.product.qty.toString()) == 1
                          ? deleteDrugFromBasket(widget.product.id)
                          : decreaseQuantity(widget.product.id);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: ConstColor.dotColor,
                      ),
                    ),
                    child: Text(
                      "-",
                      style: Styles.style400sp14Black,
                    ),
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Text(widget.product.qty.toString()),
                ScreenUtil().setHorizontalSpacing(10),
                InkWell(
                  borderRadius: BorderRadius.circular(25.r),
                  onTap: () {
                    widget.onTap();
                    if (widget.product.type == 2) {
                      if (getDrugQty(widget.product.id) >= 12) {
                        showDialog<void>(
                          context: context,
                          builder: (parentContext) {
                            return AlertDialog(
                              surfaceTintColor: ConstColor.mainWhite,
                              backgroundColor: ConstColor.mainWhite,
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              // title: const Text('Basic dialog title'),
                              content: SizedBox(
                                height: 300.h,
                                width: 350.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close)),
                                      ],
                                    ),
                                    Text(
                                      "limited_product".tr(),
                                      style: Styles.style600sp22Black,
                                    ),
                                    Text(
                                      "12 000 гр",
                                      style: Styles.style600sp22Red,
                                    ),
                                    InkWell(
                                      radius: 50.r,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 55.h,
                                        width: 328.w,
                                        decoration: BoxDecoration(
                                            color: ConstColor.as_salomText,
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                        child: Text(
                                          "OK",
                                          style: Styles.buttonText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        increaseQuantity(widget.product.id);
                      }
                    } else {
                      increaseQuantity(widget.product.id);
                    }

                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: ConstColor.dotColor,
                      ),
                    ),
                    child: Text(
                      "+",
                      style: Styles.style400sp14Black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void increaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG Quantity increase");
        product.qty++;
        print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  void decreaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG Quantity decrease");
        product.qty--;
        print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  num getDrugQty(num drugId) {
    num qty = 0;
    final drugBasket = Hive.box<BasketModel>(basketBox).values.toList();
    for (var prod in drugBasket) {
      if (prod.id == drugId) {
        qty = prod.qty;
      }
    }
    return qty;
  }

  void addDrugToBasket(int productId, String name, int type, String price,
      int qty, String size, String weight, String slug, String image) {
    final product = BasketModel(
        id: productId,
        name: name,
        type: type,
        price: price,
        qty: qty,
        image: image,
        kg: weight,
        size: size,
        slug: slug)
      ..id = productId
      ..name = name
      ..type = type
      ..price = price
      ..size = size
      ..kg = weight
      ..qty = qty
      ..slug = slug;
    final box = Hive.box<BasketModel>(basketBox);
    box.add(product);
  }

  void deleteDrugFromBasket(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    final listProducts = Hive.box<BasketModel>(basketBox);
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG REMOVED FROM BASKET");
        listProducts.delete(product.key);
        break;
      }
    }
  }

  bool isProductInHive(int productId) {
    final savedProductList = Hive.box<BasketModel>(basketBox).values.toList();
    var product = null;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }
}
