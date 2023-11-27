import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/confirm_order/confirm_order_by_card_bloc/confirm_order_by_card_bloc.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_animation_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PayingByCardPage extends StatefulWidget {
  static const routeName = "/payingByCard";
  const PayingByCardPage({super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  State<PayingByCardPage> createState() => _PayingByCardPageState();
}

class _PayingByCardPageState extends State<PayingByCardPage> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  TextEditingController phoneController = TextEditingController();
  final basketBox = Hive.box<BasketModel>('basketBox');

  int price = 0;

  getPrice(List<BasketModel> data) {
    price = 0;
    for (var i = 0; i < data.length; i++) {
      for (var a = 0; a < data[i].qty; a++) {
        data[i].price != "null"
            ? price += int.parse(data[i].price.toString())
            : price = 0;
      }
    }
    print(price);
  }

  @override
  Widget build(BuildContext context) {
    final product = basketBox.values.toList().cast<BasketModel>();
    getPrice(product);
    return Scaffold(
      bottomSheet:
          BlocConsumer<ConfirmOrderByCardBloc, ConfirmOrderByCardState>(
        listener: (context, state) {
          if (state is ConfirmOrderByCardSuccess) {
            Navigator.pushNamed(context, ConfirmAnimationPage.routeName);
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 15.w,
            ),
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ConstColor.mainWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: InkWell(
              onTap: () {
                if (phoneController.text.isEmpty ||
                    phoneController.text.length < 12) {
                  print("DATA ENTERING HERE");
                  Fluttertoast.showToast(
                      msg: "Please enter valuable number",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      backgroundColor: ConstColor.as_salomText,
                      fontSize: 16.0);
                } else {
                  context.read<ConfirmOrderByCardBloc>().add(
                        ConfirmOrderByCardData(
                          id: widget.id,
                          name: widget.name,
                          phone: phoneController.text,
                        ),
                      );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 328.w,
                decoration: BoxDecoration(
                    color: ConstColor.as_salomText,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "confirm_order".tr(),
                  style: Styles.buttonText,
                ),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: ConstColor.greyColor,
            height: 0.5,
            width: double.infinity,
          ),
        ),
        centerTitle: true,
        title: Text(
          "payment_by_card".tr(),
          style: Styles.appBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 15.w,
          right: 15.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "first_info".tr(),
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(5),
              Text(
                "${"pro_price".tr()} $price ${"sum".tr()}",
                style: Styles.style500sp14Main,
              ),
              SizedBox(
                height: 50.h,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        ConstIcons.card,
                        height: 35.h,
                      ),
                    ),
                    Text(
                      '8979 0009 9678 9090',
                      style: Styles.style400sp24Black,
                    ),
                  ],
                ),
              ),
              const Divider(),
              ScreenUtil().setVerticalSpacing(20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "second_info".tr(),
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Image.asset(
                      "assets/images/telegram.png",
                    ),
                  ),
                  ScreenUtil().setHorizontalSpacing(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@as-salom.support",
                        style: Styles.style400sp20Main,
                      ),
                      Text(
                        "+998 90 999 99 90",
                        style: Styles.styles500sp14Black,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              ScreenUtil().setVerticalSpacing(20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "third_info".tr(),
                  style: Styles.style400sp16Black,
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'your_number'.tr(),
                    style: Styles.style400sp14Black,
                  ),
                  TextSpan(
                    text: '*',
                    style: Styles.style400sp14Red,
                  ),
                ]),
              ),
              ScreenUtil().setVerticalSpacing(5),
              InputWidget(
                validateMode: AutovalidateMode.onUserInteraction,

                maxLength: 12,
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  phoneFormatter
                ],
                inputType: TextInputType.number,
                prefixIcon: Text(
                  "+998 ",
                  style: Styles.style500sp16Black,
                ),
                controller: phoneController,

                // hintText: "Введите ваше Номер",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
