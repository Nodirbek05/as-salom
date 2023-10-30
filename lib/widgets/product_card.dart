import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/product_detail/pages/product_detail.dart';
import 'package:assalomproject/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class ProductCardWidget extends StatefulWidget {
  final bool withHeight;
  final double? height;
  final ProductModel? product;
  const ProductCardWidget(
      {super.key,
      required this.withHeight,
      this.height,
      this.product});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailPage.routeName);
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
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/product_image.png")),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      height: 110,
                    ),
                    Text(
                      widget.product!.discount ?? '19 000 сум',
                      style: Styles.style600sp14Main,
                    ),
                    Text(
                      widget.product!.price ?? '34 000 сум',
                      style: Styles.style400sp12GreyUnderline,
                    ),
                    Text(
                      widget.product!.name_ru ??
                          'Молоко 2,5 % “Простоквашино”...',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.styles400sp16Black,
                    ),
                    ValueListenableBuilder(
                        valueListenable:
                            Hive.box<BasketModel>('basketBox').listenable(),
                        builder: (ctx, basket, index) {
                          return isProductInHive(
                                  int.parse(widget.product!.id.toString()))
                              ? Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ConstColor.as_salomText),
                                      color: ConstColor.mainWhite,
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        splashRadius: 8.r,
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
                                          color: ConstColor.as_salomText,
                                        ),
                                      ),
                                      Text(
                                          getDrugQty(widget.product!.id!)
                                              .toString(),
                                          style: Styles.style500sp16Black),
                                      IconButton(
                                        splashRadius: 8.r,
                                        onPressed: () {
                                          increaseQuantity(widget.product!.id!);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: ConstColor.as_salomText,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : MainButtonWidget(
                                  text: "В корзину",
                                  onTap: () {
                                    addDrugToBasket(
                                        int.parse(
                                            widget.product!.id.toString()),
                                        widget.product!.name_ru.toString(),
                                        "test",
                                        widget.product!.price.toString(),
                                        1);
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
                !isProductSavedInHive(int.parse(widget.product!.id.toString()))
                    ? addToBox(
                        widget.product!.name_ru!,
                        widget.product!.photo![0],
                        int.parse(widget.product!.id!.toString()),
                        widget.product!.price!,
                        "type of good")
                    : deleteProduct(int.parse(widget.product!.id!.toString()));
              },
              child: ValueListenableBuilder(
                valueListenable: Hive.box<FavoritesModel>("favoritesBox").listenable(),
                builder: (ctx, box, _) {
                  return isProductSavedInHive(
                          int.parse(widget.product!.id!.toString()))
                      ? const CircleAvatar(
                          backgroundColor: ConstColor.mainWhite,
                          radius: 17,
                          child: Icon(
                            Icons.favorite,
                            color: ConstColor.as_salomText,
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
    final box = Hive.box<BasketModel>('basketBox').values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG Quantity increase");
        product.qty++;
        print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  void addToBox(String name, String image, int id, String price, String type) {

    final product = FavoritesModel()
      ..name = name
      ..id = id
      ..image = image
      ..price = price
      ..type = type;

    final box = Hive.box<FavoritesModel>('favoritesBox');
    box.add(product);
  }

  void decreaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>('basketBox').values.toList();
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
    final drugBasket = Hive.box<BasketModel>('basketBox').values.toList();
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
    String type,
    String price,
    int qty,
  ) {
    final product = BasketModel()
      ..id = productId
      ..name = name
      ..type = type
      ..price = price
      ..qty = qty;
    final box = Hive.box<BasketModel>('basketBox');
    box.add(product);
  }

  void deleteDrugFromBasket(num drugId) {
    final box = Hive.box<BasketModel>('basketBox').values.toList();
    final listProducts = Hive.box<BasketModel>('basketBox');
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG REMOVED FROM BASKET");
        listProducts.delete(product.key);
        break;
      }
    }
  }

  void deleteProduct(int drugId) {
    final box = Hive.box<FavoritesModel>('favoritesBox').values.toList();
    final listProducts = Hive.box<FavoritesModel>('favoritesBox');
    for (var product in box) {
      if (drugId == product.id) {
        print("Product REMOVED FROM BASKET");
        listProducts.delete(product.key);
        break;
      }
    }
  }

  bool isProductInHive(int productId) {
    final savedProductList = Hive.box<BasketModel>('basketBox').values.toList();
    var product = null;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }

  bool isProductSavedInHive(int productId) {
    final savedProductList =
        Hive.box<FavoritesModel>('favoritesBox').values.toList();
    var product = null;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }
}
