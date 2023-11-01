import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          // automaticallyImplyLeading: false,
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
              // const SizedBox()
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
}
