import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/logic/get_spesific_products_bloc/get_spesific_products_bloc.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SpesificProductsWidget extends StatefulWidget {
  final int index;
  const SpesificProductsWidget({super.key, required this.index});

  @override
  State<SpesificProductsWidget> createState() => _SpesificProductsWidgetState();
}

class _SpesificProductsWidgetState extends State<SpesificProductsWidget> {
  @override
  void initState() {
    context.read<GetSpesificProductsBloc>().add(GetSpesificProductsDataEvent());
    super.initState();
  }

  String _getcategoryByLocale(CategoryModel category, Locale locale) {
    late String? categoryName;
    if (locale == const Locale('ru')) {
      categoryName = category.nameru;
    } else if (locale == const Locale('uz')) {
      categoryName = category.nameuz;
    } else if (locale == const Locale('en')) {
      categoryName = category.nameen;
    } else if(locale == const Locale('fr')){
      categoryName = category.nameoz;
    }
    return categoryName ?? "no_data".tr();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpesificProductsBloc, GetSpesificProductsState>(
      builder: (context, state) {
        if (state is GetSpesificProductsInitial) {
          return Center(child: shimmerWidget());
        } else if (state is GetSpesificProductsSuccess) {
          final products = state.spesificProducts.data?[widget.index].goods;
          return products!.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    // bottom: 15.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getcategoryByLocale(
                            state.spesificProducts.data![widget.index],
                            context.locale),
                        // .name_ru
                        //     .toString(),
                        style: Styles.styles700sp20Black,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        height: 285.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: 10.w,
                              ),
                              child: ProductCardWidget(
                                fromApi: true,
                                product: products[index],
                                withHeight: true,
                                height: 300.h,
                              ),
                            );
                          },
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(30),
                    ],
                  ),
                )
              : shimmerWidget();
        }
        return shimmerWidget();
      },
    );
  }

  Shimmer shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: ConstColor.dotColor,
      highlightColor: ConstColor.lightGrey,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          // bottom: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                10.r,
              )),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              height: 285.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r)),
                      height: 200.h,
                    ),
                  );
                },
              ),
            ),
            ScreenUtil().setVerticalSpacing(30),
          ],
        ),
      ),
    );
  }
}
