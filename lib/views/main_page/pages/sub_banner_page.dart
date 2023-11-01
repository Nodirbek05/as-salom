import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/main_page/logic/get_sub_banners_bloc/get_sub_banners_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                            subBanners[index].name_ru!,
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
