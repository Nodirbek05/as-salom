import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/logic/get_spesific_products_bloc/get_spesific_products_bloc.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionalProducts extends StatefulWidget {
  const AdditionalProducts({super.key});

  @override
  State<AdditionalProducts> createState() => _AdditionalProductsState();
}

class _AdditionalProductsState extends State<AdditionalProducts> {
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
    }
    return categoryName ?? "no_data".tr();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpesificProductsBloc, GetSpesificProductsState>(
      builder: (context, state) {
        if (state is GetSpesificProductsInitial) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is GetSpesificProductsSuccess) {
          // print("TESTIVIY LOGGGG ${state.spesificProducts.data![-1]}");
          final products = state.spesificProducts.data;
          return state.spesificProducts.data!.length > 1
              ? Column(
                  children: List.generate(
                      state.spesificProducts.data!.length - 1,
                      (index) => products![index + 1].goods!.isNotEmpty
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
                                        state.spesificProducts.data![index + 1],
                                        context.locale),
                                    style: Styles.styles700sp20Black,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 20.h,
                                    ),
                                    height: 310.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          products[index + 1].goods!.length,
                                      itemBuilder: (context, indx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            right: 10.w,
                                          ),
                                          child: ProductCardWidget(
                                            fromApi: true,
                                            product: products[index + 1]
                                                .goods![indx],
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
                          : const Center()),
                )
              : const Center();
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
