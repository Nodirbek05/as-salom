import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  static const routeName = "/productDetailPage";

  const ProductDetailPage({super.key});

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
                    "Итого в корзине:",
                    style: Styles.style400sp12Grey,
                  ),
                  Text(
                    "25 кг",
                    style: Styles.style600sp14Main,
                  ),
                ],
              ),
              const SizedBox()
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 115.h,
                          width: double.infinity,
                          color: ConstColor.as_salomText,
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
                          count: 5,
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
                'Сухарики ржаные «Кириешки» с ветчиной и сыром 40 г',
                style: Styles.styles700sp22Black,
              ),
              const SizedBox(height: 40),
              Text(
                "Описание товара:",
                style: Styles.styles700sp20Black,
              ),
              const SizedBox(height: 15),
              Text(
                "Состав: Хлеб из смеси ржаной и пшеничной муки (мука ржаная обдирная, мука пшеничная 2 сорт, вода, соль, дрожжи), масло растительное, ароматизатор «Ветчина с сыром» (мука пшеничная, соль, глюкоза, мальтодекстрин, ароматизатор коптильный, вкусоароматические вещества, натуральные вкусоароматические ...",
              ),
              const SizedBox(height: 40),
              Text(
                "Похожие товары",
                style: Styles.styles700sp20Black,
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: ProductCardWidget(
                          index: index, withHeight: true, height: 300.h),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
