import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/inside_category/inside_cat_first_bloc/inside_cat_first_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsideCatFirstPage extends StatefulWidget {
  static const routeName = "/insideCatFirst";
  const InsideCatFirstPage({super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  State<InsideCatFirstPage> createState() => _InsideCatFirstPageState();
}

class _InsideCatFirstPageState extends State<InsideCatFirstPage> {
  @override
  void initState() {
    context.read<InsideCatFirstBloc>().add(InsideCatFirstData(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: Styles.appBarText,
        ),
      ),
      body: BlocBuilder<InsideCatFirstBloc, InsideCatFirstState>(
        builder: (context, state) {
          print("STATE HEREEEE $state");
          if (state is InsideCatFirstFail) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is InsideCatFirstSuccess) {
            final stateData = state.modelData.category.subcategories;
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              height: double.infinity,
              width: double.infinity,
              child: GridView.builder(
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
                itemCount: stateData!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, InsideCategoryPage.routeName,
                      //     arguments: InsideCategoryPage(
                      //         id: int.parse(stateData[index].id.toString()),
                      //         name: state.modelData.category.name_ru!));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      height: 123.h,
                      width: 127.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              stateData[index].photo != null
                                  ? ApiPaths.imageUrl + stateData[index].photo!
                                  : "https://www.pole-optitec.com/img/entreprises/default.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15.r),
                        // color: ConstColor.grey300,
                      ),
                      child: Text(stateData[index].name_ru!),
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
      ),
    );
  }
}
