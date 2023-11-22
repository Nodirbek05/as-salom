import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/get_category_products_bloc/get_cat_products_bloc.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer(
      {super.key, required this.onTap, required this.subCategory});
  final List<SubCategoryModel> subCategory;
  final VoidCallback onTap;

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ConstColor.mainWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
                    widget.subCategory.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: 5.h,
                      ),
                      child: InkWell(
                        onTap: () {
                          widget.onTap();
                        },
                        child: Text(
                          widget.subCategory[index].name_ru!,
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
}
