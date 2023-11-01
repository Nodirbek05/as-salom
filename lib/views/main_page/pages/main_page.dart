import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/logic/get_all_banners_bloc/get_all_banners_bloc.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/views/main_page/logic/get_spesific_products_bloc/get_spesific_products_bloc.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_banners_bloc/get_sub_banners_bloc.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_categories_bloc/get_sub_categories_bloc.dart';
import 'package:assalomproject/views/main_page/pages/additional_products.dart';
import 'package:assalomproject/views/main_page/pages/banner_page.dart';
import 'package:assalomproject/views/main_page/pages/categories_widget.dart';
import 'package:assalomproject/views/main_page/pages/spesific_producyts_widget.dart';
import 'package:assalomproject/views/main_page/pages/sub_banner_page.dart';
import 'package:assalomproject/views/main_page/pages/sub_categories_widget.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  static const routeName = "/mainPage";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: ConstColor.greyColor,
            height: 0.5,
            width: double.infinity,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: 50.h,
          width: 400.w,
          padding: EdgeInsets.only(
            // top: 30.h,
            left: 15.w,
            right: 15.w,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: 5.h,
                left: 15.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: ConstColor.greyColor,
                  width: 0.0,
                ),
              ),
              focusColor: ConstColor.greyColor,
              hintText: "Поиск товаров",
              hintStyle: Styles.styles400sp14Black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              suffixIcon: Container(
                width: 72.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: ConstColor.as_salomText,
                  borderRadius: BorderRadius.circular(
                    30.r,
                  ),
                ),
                child: Icon(
                  Icons.search,
                  color: ConstColor.mainWhite,
                  size: 30.h,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => GetAllBannersBloc(),
              child: const BannerPage(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                bottom: 15.h,
              ),
              child: Text(
                "Категории товаров",
                style: Styles.styles700sp20Black,
              ),
            ),
            BlocProvider(
              create: (context) => GetAllCategoriesBloc(),
              child: const CategoriesWidget(),
            ),
            ScreenUtil().setVerticalSpacing(18.h),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                bottom: 15.h,
              ),
              child: Text(
                "Вам понравится",
                style: Styles.styles700sp20Black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<FavoritesModel>("favoritesBox").listenable(),
                builder: (ctx, box, _) {
                  final products = box.values.toList().cast<FavoritesModel>();
                  if (products.isEmpty) {
                    return const Center(
                      child: Text("В избранном пока пусто"),
                    );
                  }
                  return SizedBox(
                    height: 310.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 10.w,
                          ),
                          child: ProductCardWidget(
                            product: ProductModel(
                              photo: [products[index].image],
                              price: products[index].price,
                              name_ru: products[index].name,
                              id: products[index].id,
                              type_good: products[index].type,
                              discount: products[index].discount,
                            ),
                            withHeight: true,
                            height: 310.h,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ScreenUtil().setVerticalSpacing(35),
            BlocProvider(
              create: (context) => GetSpesificProductsBloc(),
              child: const SpesificProductsWidget(index: 0),
            ),
            SizedBox(
              // height: 200.h,
              child: BlocProvider(
                create: (context) => GetSubBannersBloc(),
                child: const SubBannersPage(),
              ),
            ),
            BlocProvider(
              create: (context) => GetSubCategoriesBloc(),
              child: const SubCategoriesWidget(),
            ),
            BlocProvider(
              create: (context) => GetSpesificProductsBloc(),
              child: const AdditionalProducts(),
            ),
            ScreenUtil().setVerticalSpacing(30),
          ],
        ),
      ),
    );
  }
}
