import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/get_category_products_bloc/get_cat_products_bloc.dart';
import 'package:assalomproject/views/main_page/data/models/inner_model.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:assalomproject/views/main_page/logic/search_bloc/search_bloc.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class InsideCategoryPage extends StatefulWidget {
  static const routeName = "/insideCategoryPage";
  const InsideCategoryPage(
      {super.key, required this.name, required this.id, required this.isCat});

  final String name;
  final int id;
  final bool isCat;

  @override
  State<InsideCategoryPage> createState() => _InsideCategoryPageState();
}

class _InsideCategoryPageState extends State<InsideCategoryPage> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  bool isWorking = false;
  // List<SubCategoryModel> subcategory = [];
  // CategoryGoods? insideProducts;
  List<ProductModel> insideProducts = [];
  String? name;
  int indexxx = 20;

  String _getcategoryByLocale(SubCategoryModel category, Locale locale) {
    String categoryName = "no_data".tr();
    if (locale == const Locale('ru')) {
      categoryName = category.nameru ?? "";
    } else if (locale == const Locale('uz')) {
      categoryName = category.nameuz ?? "";
    } else if (locale == const Locale('en')) {
      categoryName = category.nameen ?? "";
    }else if (locale == const Locale('fr')) {
      categoryName = category.nameuz ?? "";
    }
    return categoryName;
  }

  static Future<ResponseData> getInnerProducts(int id) async {
    // print(id);
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.subCategoryInner}$id'),
      headers: {'Content-Type': 'application/json'},
    );
    // print("SUBCATEGORY RESPONSE DATA ${response.body}");
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
  void initState() {
    context.read<GetCatProductsBloc>().add(GetProducts(id: widget.id));
    super.initState();
  }

  var query = TextEditingController();
  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: widget.isCat == true
          ? BlocBuilder<GetCatProductsBloc, GetCatProductsState>(
              builder: (context, state) {
                if (state is GetCatProductsSuccess) {
                  return Drawer(
                    backgroundColor: ConstColor.mainWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
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
                                  "filter".tr(),
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
                              left: 0.w,
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
                                  state.subcategoryModel.subcategory!
                                      .subcategories!.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 5.h,
                                    ),
                                    child: Container(
                                      color: indexxx ==
                                              state.subcategoryModel
                                                  .subcategory!.subcategories!
                                                  .indexOf(state
                                                      .subcategoryModel
                                                      .subcategory!
                                                      .subcategories![index])
                                          ? ConstColor.assalomText
                                          : null,
                                      child: ListTile(
                                        titleAlignment:
                                            ListTileTitleAlignment.center,
                                        selectedColor: ConstColor.assalomText,
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        ),
                                        onTap: () async {
                                          indexxx = state.subcategoryModel
                                              .subcategory!.subcategories!
                                              .indexOf(state
                                                  .subcategoryModel
                                                  .subcategory!
                                                  .subcategories![index]);
                                          insideProducts.clear();
                                          name = _getcategoryByLocale(
                                            state.subcategoryModel.subcategory!
                                                .subcategories![index],
                                            context.locale,
                                          );

                                          getInnerProducts(int.parse(state
                                                  .subcategoryModel
                                                  .subcategory!
                                                  .subcategories![index]
                                                  .id
                                                  .toString()))
                                              .then((value) => {
                                                    if (value is InnerModel)
                                                      {
                                                        insideProducts.addAll(
                                                            value.goods.data!),
                                                        name = value
                                                            .subcategory.nameru
                                                            .toString(),
                                                        setState(() {}),
                                                        Navigator.pop(context),
                                                      }
                                                  });
                                        },
                                        title: Text(
                                          _getcategoryByLocale(
                                            state.subcategoryModel.subcategory!
                                                .subcategories![index],
                                            context.locale,
                                          ),
                                          style: indexxx ==
                                                  state
                                                      .subcategoryModel
                                                      .subcategory!
                                                      .subcategories!
                                                      .indexOf(state
                                                              .subcategoryModel
                                                              .subcategory!
                                                              .subcategories![
                                                          index])
                                              ? Styles.style400sp14white
                                              : Styles.style400sp14Black,
                                        ),
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
                return const SizedBox();
              },
            )
          : null,
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
            controller: query,
            onChanged: (String query) {
              if (query.isNotEmpty) {
                context.read<SearchBloc>().add(SearchProduct(query: query));
              }
              setState(() {});
            },
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
              hintText: "search".tr(),
              hintStyle: Styles.styles400sp14Black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              suffixIcon: Container(
                width: 72.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: ConstColor.assalomText,
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
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            products.clear();
            for (var i = 0; i < state.data.data!.length; i++) {
              products.add(state.data.data![i]);
            }
          }
          return products.isEmpty || query.text.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 15.w,
                      ),
                      child: Text(
                        widget.isCat == true ? name ?? widget.name : "",
                        style: Styles.styles700sp20Black,
                      ),
                    ),
                    widget.isCat == true
                        ? Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.h,
                              right: 15.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "filter".tr(),
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
                          )
                        : const SizedBox(),
                    ScreenUtil().setVerticalSpacing(8),
                    BlocBuilder<GetCatProductsBloc, GetCatProductsState>(
                      builder: (context, state) {
                        // print("STATE $state ==============");
                        if (state is GetCatProductsSuccess) {
                          var products = state.subcategoryModel.goods;
                          insideProducts = products!.data!;
                          // name = state.subcategoryModel.subcategory!.name_ru
                          //     .toString();
                          // name = _getcategoryByLocale(
                          //   state.subcategoryModel.subcategory!
                          //       .subcategories![index],
                          //   context.locale,
                          // );
                          return insideProducts.isEmpty
                              ? Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 300,
                                      // width: 200,
                                      child: LottieBuilder.asset(
                                        "assets/animations/empty_box2.json",
                                      ),
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
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                    ),
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
                                          fromApi: true,
                                          product: ProductModel(
                                            descen:
                                                insideProducts[index].descen,
                                            descru:
                                                insideProducts[index].descru,
                                            descuz:
                                                insideProducts[index].descuz,
                                            id: insideProducts[index].id,
                                            discount:
                                                insideProducts[index].discount,
                                            nameru:
                                                insideProducts[index].nameru,
                                            photo: [
                                              insideProducts[index].photo![0]
                                            ],
                                            typegood:
                                                insideProducts[index].typegood,
                                            price: insideProducts[index].price,
                                            sizes: insideProducts[index].sizes!,
                                            slug: insideProducts[index].slug,
                                          ),
                                          withHeight: false,
                                        );
                                      },
                                    ),
                                  ),
                                );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                )
              : SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: products.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 300,
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
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.64,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return ProductCardWidget(
                                fromApi: true,
                                product: ProductModel(
                                    descen: products[index].descen,
                                    descru: products[index].descru,
                                    descuz: products[index].descuz,
                                    id: products[index].id,
                                    discount: products[index].discount,
                                    nameru: products[index].nameru,
                                    nameen: products[index].nameen,
                                    nameuz: products[index].nameuz,
                                    photo: products[index].photo,
                                    typegood: products[index].typegood,
                                    price: products[index].price,
                                    slug: products[index].slug),
                                withHeight: false,
                              );
                            },
                          ),
                  ),
                );
        },
      ),
    );
  }
}
