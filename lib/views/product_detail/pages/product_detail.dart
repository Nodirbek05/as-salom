import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/main_button.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  static const routeName = "/productDetailPage";

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController1 = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        height: 60.h,
        width: double.infinity,
        child: ValueListenableBuilder(
            valueListenable: Hive.box<BasketModel>('basketBox').listenable(),
            builder: (ctx, basket, index) {
              return isProductInHive(int.parse(widget.product.id.toString()))
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 175,
                          height: 50.h,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ConstColor.as_salomText),
                              color: ConstColor.mainWhite,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                splashRadius: 8.r,
                                onPressed: () {
                                  if (getDrugQty(widget.product.id!) > 1) {
                                    decreaseQuantity(widget.product.id!);
                                    setState(() {});
                                  } else {
                                    deleteDrugFromBasket(widget.product.id!);
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: ConstColor.as_salomText,
                                ),
                              ),
                              Text(getDrugQty(widget.product.id!).toString(),
                                  style: Styles.style500sp16Black),
                              IconButton(
                                splashRadius: 8.r,
                                onPressed: () {
                                  increaseQuantity(widget.product.id!);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: ConstColor.as_salomText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 175.w,
                            decoration: BoxDecoration(
                                color: ConstColor.as_salomText,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Text(
                              "Kорзинa",
                              style: Styles.buttonText,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MainButtonWidget(
                        text: "В корзину",
                        onTap: () {
                          addDrugToBasket(
                              int.parse(widget.product.id.toString()),
                              widget.product.name_ru.toString(),
                              "test",
                              widget.product.price.toString(),
                              1);
                        },
                        width: double.infinity,
                      ),
                    );
            }),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Итого в корзине:",
                    style: Styles.style400sp12Grey,
                  ),
                  Text(
                    "25 кг",
                    style: Styles.style600sp14Main,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Сумма:",
                    style: Styles.style400sp12Grey,
                  ),
                  Text(
                    "12 000 000 сум",
                    style: Styles.style600sp14Main,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController1,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product.photo!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(.2),
                                Colors.transparent
                              ],
                            ),
                            // color: ConstColor.as_salomText,
                            image: DecorationImage(
                                image: NetworkImage(
                                  ApiPaths.imageUrl +
                                      widget.product.photo![index].toString(),
                                ),
                                fit: BoxFit.contain),
                          ),
                          height: 115.h,
                          width: double.infinity,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      left: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 4.h,
                        child: SmoothPageIndicator(
                          controller: _pageController1,
                          count: widget.product.photo!.length,
                          effect: WormEffect(
                            dotColor: ConstColor.dotColor,
                            activeDotColor: ConstColor.as_salomText,
                            dotHeight: ScreenUtil().setWidth(10.0),
                            dotWidth: ScreenUtil().setWidth(10.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      // left: 16,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 10,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {
                          !isProductSavedInHive(
                                  int.parse(widget.product.id.toString()))
                              ? addToBox(
                                  widget.product.name_ru!,
                                  widget.product.photo![0],
                                  int.parse(widget.product.id!.toString()),
                                  widget.product.price!,
                                  "type of good",
                                  widget.product.discount!,
                                )
                              : deleteProduct(
                                  int.parse(widget.product.id!.toString()));
                        },
                        child: ValueListenableBuilder(
                          valueListenable:
                              Hive.box<FavoritesModel>("favoritesBox")
                                  .listenable(),
                          builder: (ctx, box, _) {
                            return isProductSavedInHive(
                                    int.parse(widget.product.id!.toString()))
                                ? Icon(
                                    Icons.favorite,
                                    color: ConstColor.as_salomText,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                    color: Colors.white,
                                  );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.name_ru.toString(),
                style: Styles.styles700sp22Black,
              ),
              const SizedBox(height: 40),
              Text(
                "Описание товара:",
                style: Styles.styles700sp20Black,
              ),
              const SizedBox(height: 15),
              Text(widget.product.desc_ru.toString()),
              const SizedBox(height: 40),
              Text(
                "Похожие товары",
                style: Styles.styles700sp20Black,
              ),
              const SizedBox(height: 25),
              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.only(
              //           right: 10.w,
              //         ),
              //         child: ProductCardWidget(withHeight: true, height: 300.h),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 100),
            ],
          ),
        ),
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

  void addToBox(String name, String image, int id, String price, String type,
      String discount) {
    final product = FavoritesModel()
      ..name = name
      ..id = id
      ..image = image
      ..price = price
      ..discount = discount
      ..type = type;

    final box = Hive.box<FavoritesModel>('favoritesBox');
    box.add(product);
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
}
