import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/basket/widgets/product_card.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_order_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasketPage extends StatefulWidget {
  final bool canBack;
  static const routeName = "/basketPage";
  const BasketPage({super.key, required this.canBack});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
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

  int price = 0;

  getPrice(List<BasketModel> data) {
    price = 0;
    for (var i = 0; i < data.length; i++) {
      for (var a = 0; a < data[i].qty; a++) {
        data[i].price != "null"
            ? price += int.parse(data[i].price.toString())
            : price = 0;
      }
    }
    print(price);
  }

  @override
  void initState() {
    getCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product =
        Hive.box<BasketModel>(basketBox).values.toList().cast<BasketModel>();
    getPrice(product);
    return Scaffold(
      bottomSheet: Container(
        height: 95.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: ConstColor.mainWhite,
          // color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
          ),
        ),
        child: Column(
          children: [
            ScreenUtil().setVerticalSpacing(10),
            // ValueListenableBuilder(
            //     valueListenable:
            //         Hive.box<BasketModel>('basketBox').listenable(),
            //     builder: (ctx, box, child) {
            //       final hiveProducts = box.values.toList().cast<BasketModel>();
            //       if (hiveProducts.isEmpty) {
            //         return const SizedBox();
            //       } else {
            //           getPrice(hiveProducts);

            // return
            Text(
              "${"total_payment".tr()} $price ${"sum".tr()}",
              style: Styles.style600sp18Black,
              // );
              // }
              // }
            ),
            ScreenUtil().setVerticalSpacing(9),
            InkWell(
              onTap: () {
                product.isNotEmpty
                    ? showDialog<void>(
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
                              height: 500.h,
                              width: 350.w,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "order_list".tr(),
                                        style: Styles.style600sp18Black,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        radius: 30.r,
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: SvgPicture.asset(
                                          ConstIcons.xbutton,
                                          height: 15.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ScreenUtil().setVerticalSpacing(15.h),
                                  SizedBox(
                                      height: 350.h,
                                      child: ListView.builder(
                                        itemBuilder: (ctx, indx) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                              bottom: 10.h,
                                            ),
                                            height: 50.h,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: ConstColor.greyColor,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 130.w,
                                                  child: Text(
                                                    product[indx].name,
                                                    style: Styles
                                                        .style400sp14Black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "х${product[indx].qty}",
                                                      style: Styles
                                                          .style400sp14Grey,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    ScreenUtil()
                                                        .setHorizontalSpacing(
                                                            10),
                                                    product[indx].price !=
                                                            "null"
                                                        ? SizedBox(
                                                            width: 90.w,
                                                            child: Text(
                                                              "${int.parse(product[indx].price) * product[indx].qty} ${"sum".tr()}",
                                                              style: Styles
                                                                  .style400sp14Black,
                                                            ),
                                                          )
                                                        : const Center()
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount: product.length,
                                      )),
                                  const Spacer(),
                                  Text(
                                    "not_cancel".tr(),
                                    style: Styles.style400sp14Red,
                                  ),
                                  ScreenUtil().setVerticalSpacing(10),
                                  InkWell(
                                    radius: 50.r,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ConfirmOrderPage.routeName);
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
                                        "confirm".tr(),
                                        style: Styles.buttonText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Fluttertoast.showToast(
                        msg: "add_pro".tr(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: ConstColor.redColor,
                        fontSize: 16.0);
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.h,
                width: 328.w,
                decoration: BoxDecoration(
                    color: ConstColor.as_salomText,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "create_order".tr(),
                  style: Styles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        automaticallyImplyLeading: widget.canBack,
        centerTitle: true,
        title: Text("cart".tr(), style: Styles.appBarText),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ValueListenableBuilder<Box<BasketModel>>(
              valueListenable: Hive.box<BasketModel>(basketBox).listenable(),
              builder: (ctx, box, index) {
                final products = box.values.toList().cast<BasketModel>();
                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScreenUtil().setVerticalSpacing(200.h),
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/basket.png",
                                ),
                                fit: BoxFit.contain),
                          ),
                        ),
                        // ScreenUtil().setVerticalSpacing(20.h),
                        Text(
                          'empty_basket'.tr(),
                          style: Styles.style500sp16Black,
                        ),

                        ScreenUtil().setVerticalSpacing(20),
                        SizedBox(
                          width: 330.w,
                          child: Text(
                            "choose_pro".tr(),
                            style: Styles.style400sp16Black,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 280,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return BasketProductCardWidget(
                                onTap: () {
                                  setState(() {});
                                },
                                product: product);
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
