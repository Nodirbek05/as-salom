import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:flutter/cupertino.dart';
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
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    height: 123.h,
                    width: 127.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fphotos%2Ffruit&psig=AOvVaw2v4ixwgG4VljZvRPSBh4Nb&ust=1698446947585000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLj03YnmlIIDFQAAAAAdAAAAABAE"),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                      // color: ConstColor.grey300,
                    ),
                    child: Text(categories[index].name_ru.toString()),
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
