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
            padding: const EdgeInsets.only(left: 10),
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
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10.w),
                          height: 123.h,
                          width: 127.w,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fphotos%2Ffruit&psig=AOvVaw2v4ixwgG4VljZvRPSBh4Nb&ust=1698446947585000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLj03YnmlIIDFQAAAAAdAAAAABAE"),
                            ),
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
