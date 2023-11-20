import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_categories_bloc/get_sub_categories_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSubCategoriesBloc, GetSubCategoriesState>(
      builder: (context, state) {
        if (state is GetSubCategoriesSuccess) {
          var categories = state.data.data!.subcategories;
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: double.infinity,
              height: 190.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.data.data!.name_ru.toString(),
                    style: Styles.styles700sp20Black,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories!.length,
                      itemBuilder: (context, index) {
                        print( ApiPaths.imageUrl +categories[index].photo.toString());
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10.w),
                          height: 123.h,
                          width: 127.w,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                  ApiPaths.imageUrl +
                                      categories[index].photo.toString(),
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15.r),
                            // color: ConstColor.grey300,
                          ),
                          child: Text(categories[index].name_ru.toString()),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
