import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/data/models/get_sub_banner.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_banners_bloc/get_sub_banners_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubBannersPage extends StatefulWidget {
  const SubBannersPage({super.key});

  @override
  State<SubBannersPage> createState() => _SubBannersPageState();
}

class _SubBannersPageState extends State<SubBannersPage> {
  @override
  void initState() {
    context.read<GetSubBannersBloc>().add(GetSubBannersEventData());
    super.initState();
  }

  String _getcategoryByLocale(SubBanners category, Locale locale) {
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
    return BlocBuilder<GetSubBannersBloc, GetSubBannersState>(
      builder: (context, state) {
        if (state is GetSubBannersInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is GetSubBannersSuccess) {
          final subBanners = state.subBanners.data;
          return Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              children: [
                ...List.generate(
                  subBanners!.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            ApiPaths.imageUrl + subBanners[index].photo!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    height: 172.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 10.h,
                          ),
                          child: Text(
                            _getcategoryByLocale(
                                subBanners[index], context.locale),
                            style: Styles.styles700sp16Black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("No Data"),
        );
      },
    );
  }
}
