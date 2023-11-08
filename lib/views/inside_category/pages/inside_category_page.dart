import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/components/filter_drawer.dart';
import 'package:assalomproject/views/inside_category/filter_bloc/filter_bloc.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InsideCategoryPage extends StatelessWidget {
  static const routeName = "/insideCategoryPage";
  InsideCategoryPage(
      {super.key, required this.model, required this.name, required this.id});

  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();

  final List<ProductModel> model;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: BlocProvider(
        create: (context) => FilterBloc(),
        child: FilterDrawer(
          id: id,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: ConstColor.greyColor,
            height: 0.5,
            width: double.infinity,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: 50.h,
          width: 400.w,
          padding: EdgeInsets.only(
            // top: 30.h,
            left: 15.w,
            right: 15.w,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: 5.h,
                left: 15.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: ConstColor.greyColor,
                  width: 0.0,
                ),
              ),
              focusColor: ConstColor.greyColor,
              hintText: "Поиск товаров",
              hintStyle: Styles.styles400sp14Black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              suffixIcon: Container(
                width: 72.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: ConstColor.as_salomText,
                  borderRadius: BorderRadius.circular(
                    30.r,
                  ),
                ),
                child: Icon(
                  Icons.search,
                  color: ConstColor.mainWhite,
                  size: 30.h,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Styles.styles700sp20Black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Фильтры",
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
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                // padding: EdgeInsets.only(
                //   left: 20,
                //   // right: 15.w,
                // ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.64,
                  //  mainAxisExtent: 300,
                  crossAxisSpacing: 10,
                ),
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    product: ProductModel(
                      id: model[index].id,
                      discount: model[index].discount,
                      name_ru: model[index].name_ru,
                      photo: [model[index].photo![0]],
                      type_good: model[index].type_good,
                      price: model[index].price,
                    ),
                    withHeight: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
