import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/basket/widgets/product_card.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';

class BasketPage extends StatelessWidget {
  static const routeName = "/basketPage";
  BasketPage({super.key});
  final basketBox = Hive.box<BasketModel>('basketBox');
  
  int price = 0;

  getPrice(List<BasketModel> data) {
    price = 0;
    for (var i = 0; i < data.length; i++) {
      for (var a = 0; a < data[i].qty; a++) {
        price += int.parse(data[i].price.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = basketBox.values.toList().cast<BasketModel>();
    getPrice(product);
    return Scaffold(
      bottomSheet: price != 0
          ? Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Итого к оплате: $price сум",
                    style: Styles.style600sp18Black,
                  ),
                  ScreenUtil().setVerticalSpacing(5),
                  InkWell(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (parentContext) {
                          return  AlertDialog(
                              backgroundColor: ConstColor.mainWhite,
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              // title: const Text('Basic dialog title'),
                              content: SizedBox(
                                // color: ConstColor.mainWhite,
                                height: 500.h,
                                width: 350.w,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Состав заказа:",
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
                                            height: 20.h,
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
                                              height: 40.h,
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
                                                  Text(
                                                    product[indx].name,
                                                    style: Styles
                                                        .style400sp14Black,
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "х${product[indx].qty}",
                                                        style: Styles
                                                            .style400sp14Grey,
                                                      ),
                                                      ScreenUtil()
                                                          .setHorizontalSpacing(
                                                              10),
                                                      Text(
                                                        "${int.parse(product[indx].price) * product[indx].qty} сум",
                                                        style: Styles
                                                            .style400sp14Black,
                                                      ),
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
                                      "*Оплаченный заказ отмене не подлежит",
                                      style: Styles.style400sp14Red,
                                    ),
                                    ScreenUtil().setVerticalSpacing(10),
                                    InkWell(
                                      radius: 50.r,
                                      onTap: () {
                                        Navigator.pushNamed(context, ChoosePaymentPage.routeName);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 45.h,
                                        width: 328.w,
                                        decoration: BoxDecoration(
                                            color: ConstColor.as_salomText,
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                        child: Text(
                                          "Подтвердить",
                                          style: Styles.buttonText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),);
                           
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      width: 328.w,
                      decoration: BoxDecoration(
                          color: ConstColor.as_salomText,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        "Оформить заказ",
                        style: Styles.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Корзина", style: Styles.appBarText),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ValueListenableBuilder<Box<BasketModel>>(
              valueListenable: Hive.box<BasketModel>('basketBox').listenable(),
              builder: (ctx, box, index) {
                final products = box.values.toList().cast<BasketModel>();
                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScreenUtil().setVerticalSpacing(200.h),
                        // Lottie.asset(
                        //     'assets/animation/pharmacy_basket_empty.json',
                        //     width: 200.w,
                        //     height: 200.w),
                        ScreenUtil().setVerticalSpacing(20.h),
                        Text(
                          'Корзина пока пуста...',
                          style: Styles.style500sp16Black,
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
                            return BasketProductCardWidget(product: product);
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
