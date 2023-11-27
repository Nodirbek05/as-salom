import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/get_category_products_bloc/get_cat_products_bloc.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InsideCatWidget extends StatefulWidget {
  InsideCatWidget({super.key, required this.name, required this.id});
  String name;
  final int id;

  @override
  State<InsideCatWidget> createState() => _InsideCatWidgetState();
}

class _InsideCatWidgetState extends State<InsideCatWidget> {
  @override
  void initState() {
    context.read<GetCatProductsBloc>().add(GetProducts(id: widget.id));
    super.initState();
  }

  bool isWorking = false;
  // List<SubCategoryModel> subcategory = [];
  // CategoryGoods? insideProducts;
  List<ProductModel> insideProducts = [];
  String? name;

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ),
          BlocBuilder<GetCatProductsBloc, GetCatProductsState>(
            builder: (context, state) {
              print("STATE $state ==============");
              if (state is GetCatProductsSuccess) {
                var products = state.subcategoryModel.goods;
                insideProducts = products!.data!;
                widget.name =
                    state.subcategoryModel.subcategory!.name_ru.toString();

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
                            sizes: insideProducts[index].sizes!,
                            slug: insideProducts[index].slug,
                            ),
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
    );
  }
}
