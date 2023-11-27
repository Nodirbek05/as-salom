import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/pages/inside_category_page.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    context.read<GetAllCategoriesBloc>().add(GetCategories());
    super.initState();
  }

  String _getcategoryByLocale(CategoryDataModel category, Locale locale) {
    late String? categoryName;
    if (locale == const Locale('ru')) {
      categoryName = category.name_ru;
    } else if (locale == const Locale('uz')) {
      categoryName = category.name_uz;
    } else if (locale == const Locale('en')) {
      categoryName = category.name_en;
    }
    return categoryName ?? "no_data".tr();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesSuccess) {
          var categories = state.categoryModel.data;
          return SizedBox(
            height: 130.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      InsideCategoryPage.routeName,
                      arguments: InsideCategoryPage(
                        name: categories[index].name_ru!,
                        id: int.parse(
                          categories[index].id!.toString(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      height: 123.h,
                      width: 127.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        // color: ConstColor.grey300,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getcategoryByLocale(
                              categories[index],
                              context.locale,
                            ),
                            style: Styles.style500sp14Black,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 90.h,
                            child: Image.network(
                              ApiPaths.imageUrl +
                                  categories[index].photo.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
