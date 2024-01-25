import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/number_formater.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/product_detail/data/models/get_pro_with_slug_model.dart';
import 'package:assalomproject/views/product_detail/pages/product_detail.dart';
import 'package:assalomproject/widgets/main_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductCardWidget extends StatefulWidget {
  final bool withHeight;
  final double? height;
  final bool fromApi;
  final ProductModel? product;
  const ProductCardWidget(
      {super.key,
      required this.fromApi,
      required this.withHeight,
      this.height,
      this.product});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  int place = 1;

  String _getcategoryByLocale(ProductModel product, Locale locale) {
    late String? productName;
    if (locale == const Locale('ru')) {
      productName = product.nameru;
    } else if (locale == const Locale('uz')) {
      productName = product.nameuz;
    } else if (locale == const Locale('en')) {
      productName = product.nameen;
    } else if (locale == const Locale('fr')) {
      productName = product.nameoz;
    }
    return productName ?? "no_data".tr();
  }

  Future<ResponseData> getProSlug(String slug) async {
    // try {

    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getWithSlug}$slug'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    // print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return GetProWithSlugModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  @override
  void initState() {
    getCache();
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        getProSlug(widget.product?.slug ?? "").then((res) {
          if (res is GetProWithSlugModel) {
            Navigator.pushNamed(context, ProductDetailPage.routeName,
                arguments: ProductDetailPage(
                    product: res.good!, slug: widget.product!.slug ?? ""));
            // print("SLUGGGGGGGG:${widget.product!.price}");
          }
        });
      },
      child: Stack(
        children: [
          Container(
              width: widget.withHeight ? 160 : null,
              height: widget.withHeight ? widget.height : null,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1), // color of grid items

                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.product!.photo!.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      ApiPaths.imageUrl +
                                          widget.product!.photo![0].toString(),
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15.r)),
                            height: 110,
                          )
                        : const Center(),
                    Text(
                      widget.fromApi
                          ? widget.product!.typegood == 3
                              ? "${NumberFormatter.currency(widget.product!.sizes![0].pivot!.price)} ${"sum".tr()} "
                              : "${NumberFormatter.currency(widget.product!.price)} ${"sum".tr()} "
                          : "${NumberFormatter.currency(widget.product!.price)} ${"sum".tr()} ",
                      style: Styles.style600sp14Main,
                    ),
                    widget.product!.discount != null
                        ? Text(
                            widget.product!.discount != null
                                ? "${NumberFormatter.currency(widget.product!.discount)} ${"sum".tr()}"
                                : "no_data".tr(),
                            style: Styles.style400sp12GreyUnderline,
                          )
                        : const SizedBox(),
                    Text(
                      _getcategoryByLocale(widget.product!, context.locale),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.styles400sp16Black,
                    ),
                    ValueListenableBuilder(
                        valueListenable:
                            Hive.box<BasketModel>(basketBox).listenable(),
                        builder: (ctx, basket, index) {
                          return isProductInHive(
                                  int.parse(widget.product!.id.toString()))
                              ? Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ConstColor.assalomText),
                                      color: ConstColor.mainWhite,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        // splashRadius: 8.r,
                                        onPressed: () {
                                          if (getDrugQty(widget.product!.id!) >
                                              1) {
                                            decreaseQuantity(
                                                widget.product!.id!);
                                            setState(() {});
                                          } else {
                                            deleteDrugFromBasket(
                                                widget.product!.id!);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: ConstColor.assalomText,
                                        ),
                                      ),
                                      Text(
                                          getDrugQty(widget.product!.id!)
                                              .toString(),
                                          style: Styles.style500sp16Black),
                                      IconButton(
                                        // splashRadius: 8.r,
                                        onPressed: () {
                                          if (widget.product!.typegood == 2 &&
                                              isHome == false) {
                                            if (getDrugQty(
                                                    widget.product!.id!) >=
                                                12) {
                                              showDialog<void>(
                                                context: context,
                                                builder: (parentContext) {
                                                  return AlertDialog(
                                                    surfaceTintColor:
                                                        ConstColor.mainWhite,
                                                    backgroundColor:
                                                        ConstColor.mainWhite,
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                    ),
                                                    // title: const Text('Basic dialog title'),
                                                    content: SizedBox(
                                                      height: 300.h,
                                                      width: 350.w,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon: const Icon(Icons
                                                                      .close)),
                                                            ],
                                                          ),
                                                          Text(
                                                            "limited_product"
                                                                .tr(),
                                                            style: Styles
                                                                .style600sp22Black,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            "12 000 гр",
                                                            style: Styles
                                                                .style600sp22Red,
                                                          ),
                                                          InkWell(
                                                            radius: 50.r,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 55.h,
                                                              width: 328.w,
                                                              decoration: BoxDecoration(
                                                                  color: ConstColor
                                                                      .assalomText,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.r)),
                                                              child: Text(
                                                                "OK",
                                                                style: Styles
                                                                    .buttonText,
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
                                              increaseQuantity(
                                                  widget.product!.id!);
                                            }
                                          } else {
                                            increaseQuantity(
                                                widget.product!.id!);
                                          }

                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: ConstColor.assalomText,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : MainButtonWidget(
                                  height: 35.h,
                                  textStyle: false,
                                  text: "add_box".tr(),
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "add_to_busket".tr(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        backgroundColor:
                                            ConstColor.assalomText,
                                        fontSize: 16.0);
                                    addDrugToBasket(
                                        int.parse(
                                            widget.product!.id.toString()),
                                        _getcategoryByLocale(
                                            widget.product!, context.locale),
                                        widget.product!.typegood!,
                                        widget.product!.typegood! == 3
                                            ? widget
                                                .product!.sizes![0].pivot!.price
                                                .toString()
                                            : widget.product!.price.toString(),
                                        1,
                                        widget.product!.photo![0].toString(),
                                        widget.product!.sizes != null &&
                                                widget
                                                    .product!.sizes!.isNotEmpty
                                            ? widget.product!.sizes![0].id
                                                .toString()
                                            : "null",
                                        widget.product!.weight != null
                                            ? widget.product!.weight!
                                            : "null",
                                        widget.product!.slug != null
                                            ? widget.product!.slug!
                                            : "null",
                                        widget.product!.typegood == 3
                                            ? widget.product!.sizes![0].number!
                                            : "");
                                  },
                                  width: 140,
                                );
                        }),
                    // MainButtonWidget(
                    //   text: "В корзину",
                    //   onTap: () {},
                    //   width: 140,
                    // )
                  ],
                ),
              )),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              borderRadius: BorderRadius.circular(20.r),
              onTap: () {
                // print(widget.product!.sizes![0].id.toString);
                !isProductSavedInHive(int.parse(widget.product!.id.toString()))
                    ? addToBox(
                        widget.product!.nameru ?? "",
                        widget.product!.nameen ?? "",
                        widget.product!.nameuz ?? "",
                        widget.product!.nameoz ?? "",
                        widget.product!.descru ?? "",
                        widget.product!.descuz ?? "",
                        widget.product!.descen ?? "",
                        widget.product!.descoz ?? "",
                        widget.product!.photo![0],
                        widget.product!.id != null
                            ? int.parse(widget.product!.id.toString())
                            : 0,
                        widget.product!.typegood! == 3
                            ? widget.product!.sizes![0].pivot!.price.toString()
                            : widget.product!.price.toString(),
                        widget.product!.typegood ?? 0,
                        widget.product!.discount.toString(),
                        widget.product!.sizes != null &&
                                widget.product!.sizes!.isNotEmpty
                            ? widget.product!.sizes![0].id.toString()
                            : "no_data".tr(),
                        widget.product!.weight != null
                            ? widget.product!.weight!
                            : "no_data".tr(),
                        widget.product!.slug ?? "",
                      )
                    : deleteProduct(int.parse(widget.product!.id!.toString()));
              },
              child: ValueListenableBuilder(
                valueListenable: Hive.box<FavoritesModel>(favBox).listenable(),
                builder: (ctx, box, _) {
                  return isProductSavedInHive(
                          int.parse(widget.product!.id!.toString()))
                      ? const CircleAvatar(
                          backgroundColor: ConstColor.mainWhite,
                          radius: 17,
                          child: Icon(
                            Icons.favorite,
                            color: ConstColor.assalomText,
                          ),
                        )
                      : const CircleAvatar(
                          backgroundColor: ConstColor.mainWhite,
                          radius: 17,
                          child: Icon(
                            Icons.favorite_border,
                          ),
                        );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void increaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        // print("DRUG Quantity increase");
        product.qty++;
        // print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  void addToBox(
      String nameru,
      String nameen,
      String nameuz,
      String nameoz,
      String descru,
      String descuz,
      String descen,
      String descoz,
      String image,
      int id,
      String price,
      int type,
      String discount,
      String size,
      String kg,
      String slug) {
    final product = FavoritesModel(
        nameen: nameen,
        nameuz: nameuz,
        nameoz: nameoz,
        nameru: nameru,
        descen: descen,
        descoz: descoz,
        descru: descru,
        descuz: descuz,
        discount: discount,
        id: id,
        image: image,
        price: price,
        type: type,
        kg: kg,
        size: size,
        slug: slug)
      ..nameru = nameru
      ..nameen = nameen
      ..nameuz = nameuz
      ..nameoz = nameoz
      ..descru = descru
      ..descen = descen
      ..descuz = descuz
      ..descoz = descoz
      ..id = id
      ..image = image
      ..price = price
      ..discount = discount
      ..type = type
      ..kg = kg
      ..size = size
      ..slug = slug;

    final box = Hive.box<FavoritesModel>(favBox);
    box.add(product);
  }

  void decreaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        // print("DRUG Quantity decrease");
        product.qty--;
        // print("DRUG Quantity ${product.qty}");
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

  void addDrugToBasket(
      int productId,
      String name,
      int type,
      String price,
      int qty,
      String image,
      String size,
      String kg,
      String slug,
      String selectedSize) {
    final product = BasketModel(
        id: productId,
        name: name,
        type: type,
        price: price,
        image: image,
        size: size,
        qty: qty,
        kg: kg,
        slug: slug,
        selectedSize: selectedSize)
      ..id = productId
      ..name = name
      ..type = type
      ..price = price
      ..image = image
      ..qty = qty
      ..size = size
      ..kg = kg
      ..slug = slug
      ..selectedSize = selectedSize;

    final box = Hive.box<BasketModel>(basketBox);
    box.add(product);
  }

  void deleteDrugFromBasket(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    final listProducts = Hive.box<BasketModel>(basketBox);
    for (var product in box) {
      if (drugId == product.id) {
        // print("DRUG REMOVED FROM BASKET");
        listProducts.delete(product.key);
        break;
      }
    }
  }

  void deleteProduct(int drugId) {
    final box = Hive.box<FavoritesModel>(favBox).values.toList();
    final listProducts = Hive.box<FavoritesModel>(favBox);
    for (var product in box) {
      if (drugId == product.id) {
        // print("Product REMOVED FROM BASKET");
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

  bool isProductSavedInHive(int productId) {
    final savedProductList = Hive.box<FavoritesModel>(favBox).values.toList();
    var product = null;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }
}
