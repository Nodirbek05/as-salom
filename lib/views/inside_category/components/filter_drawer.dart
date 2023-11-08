import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/filter_bloc/filter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key, required this.id});
  final int id;

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {


  @override
  void initState() {
  context.read<FilterBloc>().add(FilterData(id: widget.id));
    super.initState();
  }
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
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterFailed) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state is FilterSuccess) {
                  final filterGoods = state.filterModel.goods;
                  final filterCat = state.filterModel.subcategory;
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filterCat.name_ru!,
                          style: Styles.style500sp14Main,
                        ),
                        ScreenUtil().setVerticalSpacing(5),
                        ...List.generate(
                          filterGoods.data!.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: 5.h,
                            ),
                            child: Text(
                              filterGoods.data![index].name_ru!,
                              style: Styles.styles400sp14Black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
