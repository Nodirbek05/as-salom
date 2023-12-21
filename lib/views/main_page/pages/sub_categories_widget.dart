import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/pages/inside_category_page.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_categories_bloc/get_sub_categories_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoriesWidget extends StatefulWidget {
  const SubCategoriesWidget({super.key});

  @override
  State<SubCategoriesWidget> createState() => _SubCategoriesWidgetState();
}

class _SubCategoriesWidgetState extends State<SubCategoriesWidget> {
  @override
  void initState() {
    context.read<GetSubCategoriesBloc>().add(SubCategories());
    super.initState();
  }

  String _getcategoryByLocale(SubCategoryModel category, Locale locale) {
    late String? categoryName;
    if (locale == const Locale('ru')) {
      categoryName = category.name_ru;
    } else if (locale == const Locale('uz')) {
      categoryName = category.name_uz;
    } else if (locale == const Locale('en')) {
      categoryName = category.name_en;
    } else if (locale == const Locale('en')) {
      categoryName = category.name_en;
    }
    return categoryName ?? "no_data".tr();
  }

  String _getSubCategoryByLocale(SubCategoriesModel category, Locale locale) {
    late String? categoryName;
    if (locale == const Locale('ru')) {
      categoryName = category.name_ru;
    } else if (locale == const Locale('uz')) {
      categoryName = category.name_uz;
    } else if (locale == const Locale('en')) {
      categoryName = category.name_en;
    } else if (locale == const Locale('en')) {
      categoryName = category.name_en;
    }
    return categoryName ?? "no_data".tr();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSubCategoriesBloc, GetSubCategoriesState>(
      builder: (context, state) {
        if (state is GetSubCategoriesSuccess) {
          var categories = state.data.data!.subcategories;
          return categories!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 190.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getSubCategoryByLocale(
                              state.data.data!, context.locale),
                          style: Styles.styles700sp20Black,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 130.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              print(ApiPaths.imageUrl +
                                  categories[index].photo.toString());
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.r),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      InsideCategoryPage.routeName,
                                      arguments: InsideCategoryPage(
                                        isCat: false,
                                        name: categories[index].name_ru!,
                                        id: int.parse(
                                          categories[index]
                                              .category_id!
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    height: 123.h,
                                    width: 127.w,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,

                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Colors.grey.withOpacity(.1),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  ApiPaths.imageUrl +
                                                      categories[index]
                                                          .photo
                                                          .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          height: 85.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center();
        }
        return shimmerWidget();
      },
    );
  }

  Shimmer shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: ConstColor.dotColor,
      highlightColor: ConstColor.lightGrey,
      child: SizedBox(
        height: 130.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 15.w,
              ),
              child: Container(
                padding: EdgeInsets.all(10.w),
                height: 123.h,
                width: 127.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ConstColor.grey300,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: Styles.style500sp14Black,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 85.h,
                      width: 90.h,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
