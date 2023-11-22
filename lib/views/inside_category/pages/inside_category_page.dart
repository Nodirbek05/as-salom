import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/components/filter_drawer.dart';
import 'package:assalomproject/views/inside_category/filter_bloc/filter_bloc.dart';
import 'package:assalomproject/views/inside_category/get_category_products_bloc/get_cat_products_bloc.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/inner_model.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_svg/svg.dart';

class InsideCategoryPage extends StatefulWidget {
  static const routeName = "/insideCategoryPage";
  const InsideCategoryPage({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  State<InsideCategoryPage> createState() => _InsideCategoryPageState();
}

class _InsideCategoryPageState extends State<InsideCategoryPage> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    context.read<GetCatProductsBloc>().add(GetProducts(id: widget.id));
    super.initState();
  }

  bool isWorking = false;
  // List<SubCategoryModel> subcategory = [];
  // CategoryGoods? insideProducts;
  List<ProductModel> insideProducts = [];

  static Future<ResponseData> getInnerProducts(int id) async {
    print(id);
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.subCategoryInner}$id'),
      headers: {'Content-Type': 'application/json'},
    );
    print("SUBCATEGORY RESPONSE DATA ${response.body}");
    switch (response.statusCode) {
      case StatusCodes.ok:
        return InnerModel.fromJson(response.body);
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: BlocBuilder<GetCatProductsBloc, GetCatProductsState>(
        builder: (context, state) {
          if (state is GetCatProductsSuccess) {
            return Drawer(
              backgroundColor: ConstColor.mainWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        top: 10.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Фильтры",
                            style: Styles.styles700sp20Black,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(
                              ConstIcons.xbutton,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   filterCat.name_ru!,
                          //   style: Styles.style500sp14Main,
                          // ),
                          ScreenUtil().setVerticalSpacing(5),
                          ...List.generate(
                            state.subcategoryModel.subcategory!.subcategories!
                                .length,
                            (index) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 5.h,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  insideProducts.clear();

                                  getInnerProducts(int.parse(state
                                          .subcategoryModel
                                          .subcategory!
                                          .subcategories![index]
                                          .id
                                          .toString()))
                                      .then((value) => {
                                            if (value is InnerModel)
                                              {
                                                insideProducts
                                                    .addAll(value.goods.data!),
                                                setState(() {}),
                                                Navigator.pop(context),
                                              }
                                          });
                                },
                                child: Text(
                                  state.subcategoryModel.subcategory!
                                      .subcategories![index].name_ru!,
                                  style: Styles.styles400sp14Black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
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
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: Styles.styles700sp20Black,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "Фильтры",
                        style: Styles.style400sp15Black,
                      ),
                      ScreenUtil().setHorizontalSpacing(5),
                      GestureDetector(
                        onTap: () {
                          drawerKey.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset(
                          ConstIcons.filter,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<GetCatProductsBloc, GetCatProductsState>(
              builder: (context, state) {
                print("STATE $state ==============");
                if (state is GetCatProductsSuccess) {
                  var products = state.subcategoryModel.goods;
                  insideProducts = products!.data!;

                  // if (!isWorking) {
                  //   insideProducts = products;

                  //   for (var i = 0;
                  //       i <
                  //           state.subcategoryModel.subcategory!.subcategories!
                  //               .length;
                  //       i++) {
                  //     subcategory.add(state
                  //         .subcategoryModel.subcategory!.subcategories![i]);
                  //   }
                  //   isWorking = true;
                  // }
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.64,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: insideProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCardWidget(
                          product: ProductModel(
                              id: insideProducts[index].id,
                              discount: insideProducts[index].discount,
                              name_ru: insideProducts[index].name_ru,
                              photo: [insideProducts[index].photo![0]],
                              type_good: insideProducts[index].type_good,
                              price: insideProducts[index].price,
                              sizes: insideProducts[index].sizes!),
                          withHeight: false,
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
