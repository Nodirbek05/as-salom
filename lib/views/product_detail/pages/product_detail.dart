import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/number_formater.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/basket/pages/basket_page.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/product_detail/get_pro_with_slug_bloc/get_product_with_slug_bloc.dart';
import 'package:assalomproject/widgets/main_button.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:html/parser.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final String slug;

  static const routeName = "/productDetailPage";

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.slug,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController1 = PageController(viewportFraction: 1.0);
  int selectedSize = 0;
  int selectedSizePrice = 0;
  int selectedSizeIndex = 0;

  String firstHalf = "";
  String secondHalf = "";
  bool flag = true;

  @override
  void initState() {
    getCache();
    context.read<GetProductWithSlugBloc>().add(
          GetProductWithSlugData(
            slug: widget.slug,
          ),
        );
    // print("GET PRODUCT WITH SLUG IS WORKING");
    super.initState();
  }

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

  String _getDescByLocale(ProductModel product, Locale locale) {
    late String? productName;
    if (locale == const Locale('ru')) {
      productName = _parseHtmlString(product.descru ?? "");
    } else if (locale == const Locale('uz')) {
      productName = _parseHtmlString(product.descuz ?? "");
    } else if (locale == const Locale('en')) {
      productName = _parseHtmlString(product.descen ?? "");
    } else if (locale == const Locale('fr')) {
      productName = _parseHtmlString(product.descoz ?? "");
    }
    return productName ?? "no_data".tr();
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
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
    // print(widget.product.)
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        margin: EdgeInsets.only(bottom: 10.h),
        color: Colors.white,
        height: 70.h,
        width: double.infinity,
        child: ValueListenableBuilder(
          valueListenable: Hive.box<BasketModel>(basketBox).listenable(),
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
                            border: Border.all(color: ConstColor.assalomText),
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
                                } else {
                                  deleteDrugFromBasket(widget.product.id!);
                                }

                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: ConstColor.assalomText,
                              ),
                            ),
                            Text(getDrugQty(widget.product.id!).toString(),
                                style: Styles.style500sp16Black),
                            IconButton(
                              splashRadius: 8.r,
                              onPressed: () {
                                if (widget.product.typegood == 2 &&
                                    isHome == false) {
                                  if (getDrugQty(widget.product.id!) >= 12) {
                                    showDialog<void>(
                                      context: context,
                                      builder: (parentContext) {
                                        return AlertDialog(
                                          surfaceTintColor:
                                              ConstColor.mainWhite,
                                          backgroundColor: ConstColor.mainWhite,
                                          insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                          ),
                                          // title: const Text('Basic dialog title'),
                                          content: Container(
                                            margin: EdgeInsets.only(
                                              left: 10.w,
                                            ),
                                            height: 300.h,
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),
                                                  ],
                                                ),
                                                Text(
                                                  "limited_product".tr(),
                                                  style:
                                                      Styles.style600sp22Black,
                                                  textAlign: TextAlign.center,
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
                                                        color: ConstColor
                                                            .assalomText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50.r)),
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
                                    increaseQuantity(widget.product.id!);
                                  }
                                } else {
                                  increaseQuantity(widget.product.id!);
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
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, BasketPage.routeName,
                              arguments: true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              color: ConstColor.assalomText,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: Text(
                            "box".tr(),
                            style: Styles.buttonText,
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButtonWidget(
                      height: 30.h,
                      textStyle: true,
                      text: "add_box".tr(),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "add_to_busket".tr(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            backgroundColor: ConstColor.assalomText,
                            fontSize: 16.0);
                        addDrugToBasket(
                            int.parse(widget.product.id.toString()),
                            widget.product.nameru.toString(),
                            widget.product.typegood ?? 0,
                            widget.product.typegood == 3
                                ? selectedSizePrice != 0
                                    ? selectedSizePrice.toString()
                                    : widget.product.sizes![0].pivot!.price
                                        .toString()
                                : widget.product.price.toString(),
                            1,
                            widget.product.photo![0].toString(),
                            selectedSize != 0 ? selectedSize.toString() : "",
                            widget.product.weight ?? "",
                            widget.product.sizes!.isNotEmpty
                                ? widget
                                    .product.sizes![selectedSizeIndex].number
                                    .toString()
                                : "");

                        setState(() {});
                      },
                      width: double.infinity,
                    ),
                  );
          },
        ),
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ValueListenableBuilder<Box<BasketModel>>(
              valueListenable: Hive.box<BasketModel>(basketBox).listenable(),
              builder: (ctx, box, value) {
                return AppBar(
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "total_box".tr(),
                            style: Styles.style400sp12Grey,
                          ),
                          Text(
                            "${getDrugQty(widget.product.id!)} ${getType(widget.product.id!)}",
                            style: Styles.style600sp14Main,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "total_price".tr(),
                            style: Styles.style400sp12Grey,
                          ),
                          Text(
                            "${NumberFormatter.currency(int.parse(getPrice(widget.product.id!)))} ${"sum".tr()}",
                            style: Styles.style600sp14Main,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, BasketPage.routeName,
                                arguments: true);
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                );
              })),
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
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent
                            ],
                            stops: const [
                              0.10,
                              0.60,
                              0.60,
                              0.60
                            ]),
                        // color: ConstColor.assalomText,
                      ),
                      height: 115.h,
                      width: double.infinity,
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
                            activeDotColor: ConstColor.assalomText,
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
                                  widget.product.nameru ?? "",
                                  widget.product.nameen ?? "",
                                  widget.product.nameuz ?? "",
                                  widget.product.nameoz ?? "",
                                  widget.product.descen ?? "",
                                  widget.product.descru ?? "",
                                  widget.product.descuz ?? "",
                                  widget.product.descoz ?? "",
                                  widget.product.photo![0],
                                  widget.product.id != null
                                      ? int.parse(widget.product.id.toString())
                                      : 0,
                                  widget.product.price.toString(),
                                  widget.product.typegood ?? 0,
                                  widget.product.discount.toString(),
                                  widget.product.slug ?? "",
                                )
                              : deleteProduct(
                                  int.parse(widget.product.id!.toString()));
                        },
                        child: ValueListenableBuilder(
                          valueListenable:
                              Hive.box<FavoritesModel>(favBox).listenable(),
                          builder: (ctx, box, _) {
                            return isProductSavedInHive(
                                    int.parse(widget.product.id!.toString()))
                                ? const Icon(
                                    Icons.favorite,
                                    color: ConstColor.assalomText,
                                    size: 30,
                                  )
                                : const Icon(
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
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                child: Text(
                  _getcategoryByLocale(widget.product, context.locale),
                  // widget.product.name_ru.toString(),
                  style: Styles.styles700sp22Black,
                ),
              ),
              const SizedBox(height: 20),
              widget.product.typegood == 1
                  ? Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${"brutto".tr()} : ${widget.product.weightbruto}гр.",
                            style: Styles.style400sp14Grey,
                          ),
                          Text(
                            "${"price_for".tr()} шт:",
                            style: Styles.style700sp18Black,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.product.price != "null"
                                    ? "${NumberFormatter.currency(widget.product.price)} ${"sum".tr()}"
                                    : 0.toString(),
                                style: Styles.style700sp22Main,
                              ),
                              const SizedBox(width: 15),
                              widget.product.discount != null
                                  ? Text(
                                      widget.product.discount != null
                                          ? "${NumberFormatter.currency(widget.product.discount)} ${"sum".tr()}"
                                          : "no_data".tr(),
                                      style: Styles.style400sp20GreyUnderline,
                                    )
                                  : const Center()
                            ],
                          )
                        ],
                      ),
                    )
                  : widget.product.typegood == 2
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${"price_for".tr()} ${widget.product.weight} гр:",
                                style: Styles.style700sp18Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.product.price != "null"
                                        ? "${NumberFormatter.currency(widget.product.price)} ${"sum".tr()}"
                                        : "no_data".tr(),
                                    style: Styles.style700sp22Main,
                                  ),
                                  const SizedBox(width: 15),
                                  widget.product.discount != null
                                      ? Text(
                                          widget.product.discount != null
                                              ? "${NumberFormatter.currency(widget.product.discount)} ${"sum".tr()}"
                                              : "no_data".tr(),
                                          style:
                                              Styles.style400sp20GreyUnderline,
                                        )
                                      : const Center()
                                ],
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "price".tr(),
                                style: Styles.style700sp18Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    selectedSizePrice != 0
                                        ? "${NumberFormatter.currency(selectedSizePrice)} ${"sum".tr()}"
                                        : "${NumberFormatter.currency(widget.product.sizes![0].pivot!.price)} ${"sum".tr()}",
                                    style: Styles.style700sp22Main,
                                  ),
                                  const SizedBox(width: 15),
                                  widget.product.discount != null
                                      ? Text(
                                          widget.product.discount != null
                                              ? "${NumberFormatter.currency(widget.product.discount)} ${"sum".tr()}"
                                              : "no_data".tr(),
                                          style:
                                              Styles.style400sp20GreyUnderline,
                                        )
                                      : const Center()
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "size".tr(),
                                style: Styles.style700sp18Black,
                              ),
                              const SizedBox(height: 10),
                              widget.product.sizes != null
                                  ? SizedBox(
                                      width: double.infinity,
                                      height: 70,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.product.sizes!.length,
                                        itemBuilder: (ctx, indx) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: InkWell(
                                              onTap: () {
                                                selectedSize = int.parse(widget
                                                    .product.sizes![indx].id!
                                                    .toString());
                                                setState(() {
                                                  selectedSize;
                                                  selectedSizePrice = widget
                                                              .product
                                                              .sizes![indx]
                                                              .pivot!
                                                              .price !=
                                                          null
                                                      ? int.parse(widget
                                                          .product
                                                          .sizes![indx]
                                                          .pivot!
                                                          .price!
                                                          .toString())
                                                      : 0;

                                                  widget.product.sizes!
                                                          .isNotEmpty
                                                      ? selectedSizeIndex =
                                                          widget.product.sizes!
                                                              .indexOf(widget
                                                                  .product
                                                                  .sizes![indx])
                                                      : null;
                                                });
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: selectedSize ==
                                                            widget.product
                                                                .sizes![indx].id
                                                        ? ConstColor
                                                            .assalomText
                                                        : ConstColor.lightGrey,
                                                  ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: selectedSize ==
                                                        widget.product
                                                            .sizes![indx].id!
                                                    ? 80
                                                    : 73,
                                                height: selectedSize ==
                                                        widget.product
                                                            .sizes![indx].id!
                                                    ? 80
                                                    : 70,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(widget.product
                                                        .sizes![indx].number
                                                        .toString()),
                                                    Text(widget.product
                                                        .sizes![indx].nameru
                                                        .toString()),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Center()
                            ],
                          ),
                        ),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  "info_item".tr(),
                  style: Styles.styles700sp20Black,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(flag &&
                        _getDescByLocale(widget.product, context.locale)
                                .length >
                            320
                    ? "${_getDescByLocale(widget.product, context.locale).substring(0, 320)}..."
                    : _getDescByLocale(widget.product, context.locale)),
              ),
              ScreenUtil().setVerticalSpacing(10),
              _getDescByLocale(widget.product, context.locale).length > 320
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                      child: Text(
                        flag ? "more".tr() : "less".tr(),
                        style: Styles.styles700sp16BlueUnder,
                      ))
                  : const Center(),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  "similars".tr(),
                  style: Styles.styles700sp20Black,
                ),
              ),
              const SizedBox(height: 25),
              BlocBuilder<GetProductWithSlugBloc, GetProductWithSlugState>(
                builder: (context, state) {
                  if (state is GetProductWithSlugFailed) {
                    return const Center();
                  } else if (state is GetProductWithSlugSuccess) {
                    final randomGoods = state.dataModel.randomgoods;
                    return randomGoods!.isNotEmpty
                        ? SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: randomGoods.length,
                              itemBuilder: (context, ranIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.w,
                                  ),
                                  child: ProductCardWidget(
                                    fromApi: true,
                                    withHeight: true,
                                    product: ProductModel(
                                      price: randomGoods[ranIndex].price,
                                      nameru: randomGoods[ranIndex].nameru,
                                      id: randomGoods[ranIndex].id,
                                      photo: randomGoods[ranIndex].photo,
                                      typegood: int.parse(randomGoods[ranIndex]
                                          .typegood
                                          .toString()),
                                      slug: randomGoods[ranIndex].slug,
                                      weight: randomGoods[ranIndex].weight,
                                      sizes: randomGoods[ranIndex].sizes,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 200,
                                // width: 200,
                                child: LottieBuilder.asset(
                                    "assets/animations/empty_box2.json"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "empty_data".tr(),
                                style: const TextStyle(
                                    color: ConstColor.mainBlack),
                              ),
                            ],
                          );
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  void increaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        product.qty++;
        break;
      }
    }
  }

  void decreaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        product.qty--;
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

  String getType(num id) {
    int type = 0;
    final drugBasket = Hive.box<BasketModel>(basketBox).values.toList();
    for (var prod in drugBasket) {
      if (prod.id == id) {
        type = prod.type;
      }
    }
    if (type == 1) {
      return "шт.";
    } else if (type == 2) {
      return "кг.";
    } else if (type == 3) {
      return "размер.";
    }
    return "";
  }

  String getPrice(num id) {
    num sum = 0;
    final drugBasket = Hive.box<BasketModel>(basketBox).values.toList();
    for (var prod in drugBasket) {
      if (prod.id == id) {
        for (var i = 0; i < prod.qty; i++) {
          sum += prod.price != "null" ? int.parse(prod.price) : 0;
        }
      }
    }
    return sum.toString();
  }

  void addDrugToBasket(int productId, String name, int type, String price,
      int qty, String image, String? size, String? kg, String? selectedSize) {
    final product = BasketModel(
        id: productId,
        name: name,
        type: type,
        price: price,
        qty: qty,
        image: image,
        size: size,
        kg: kg,
        selectedSize: selectedSize)
      ..id = productId
      ..name = name
      ..type = type
      ..price = price
      ..image = image
      ..size = size
      ..kg = kg
      ..qty = qty
      ..selectedSize;
    final box = Hive.box<BasketModel>(basketBox);
    box.add(product);
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
      String slug) {
    final product = FavoritesModel(
      id: id,
      nameru: nameru,
      type: type,
      price: price,
      descen: descen,
      descuz: descuz,
      descru: descru,
      descoz: descoz,
      discount: discount,
      image: image,
      nameen: nameen,
      nameoz: nameoz,
      nameuz: nameuz,
    )
      ..nameru = nameru
      ..nameen = nameen
      ..nameuz = nameuz
      ..descru = descru
      ..descen = descen
      ..descuz = descuz
      ..id = id
      ..image = image
      ..price = price
      ..discount = discount
      ..type = type
      ..slug = slug;

    final box = Hive.box<FavoritesModel>(favBox);
    box.add(product);
  }

  void deleteProduct(int drugId) {
    final box = Hive.box<FavoritesModel>(favBox).values.toList();
    final listProducts = Hive.box<FavoritesModel>(favBox);
    for (var product in box) {
      if (drugId == product.id) {
        listProducts.delete(product.key);
        break;
      }
    }
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

  void deleteDrugFromBasket(num drugId) {
    final box = Hive.box<BasketModel>(basketBox).values.toList();
    final listProducts = Hive.box<BasketModel>(basketBox);
    for (var product in box) {
      if (drugId == product.id) {
        listProducts.delete(product.key);
        break;
      }
    }
  }
}
