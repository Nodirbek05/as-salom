import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_animation_page.dart';
import 'package:assalomproject/views/confirm_order/pages/paying_by_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChoosePaymentPage extends StatefulWidget {
  static const routeName = "/choosePayment";
  const ChoosePaymentPage({super.key});

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final basketBox = Hive.box<BasketModel>('basketBox');
  int? paymentType;
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    final products = basketBox.values.toList().cast<BasketModel>();

    return Scaffold(
      bottomSheet: Container(
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
            List<GoodModel> goods = [];
            for (var i = 0; i < products.length; i++) {
              goods.add(GoodModel(
                  goodId: products[i].id,
                  qty: products[i].qty,
                  sizes: [],
                  weight: products[i].qty));
            }
            context.read<CreateOrderBloc>().add(
                  Makeorder(
                    good: CreateOrderModel(
                      desc: commentController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      paymentType: 2,
                      goods: goods,
                    ),
                  ),
                );
          },
          child: Container(
            alignment: Alignment.center,
            height: 35.h,
            width: 328.w,
            decoration: BoxDecoration(
                color: ConstColor.as_salomText,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              "Оплатить заказ",
              style: Styles.buttonText,
            ),
          ),
        ),
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
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: ConstColor.mainBlack,
        ),
        centerTitle: true,
        backgroundColor: ConstColor.mainWhite,
        title: Text(
          "Оформление заказа",
          style: Styles.appBarText,
        ),
      ),
      body: BlocListener<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) {
          if (state is CreateOrderSuccess) {
            Navigator.pushNamed(context, ConfirmAnimationPage.routeName);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 15.w,
            right: 15.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ф.И.О получателя*',
                  style: Styles.style400sp14Black,
                ),
                InputWidget(
                  hintText: "Введите И.Ф.О",
                  controller: nameController,
                ),
                ScreenUtil().setVerticalSpacing(20),
                InputWidget(
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
                  label: "Номер телефона",
                  // hintText: "Введите ваше Номер",
                ),
                ScreenUtil().setVerticalSpacing(20),
                Text(
                  'Способ оплаты*',
                  style: Styles.style400sp14Black,
                ),
                ScreenUtil().setVerticalSpacing(10),
                ...List.generate(
                  1,
                  (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          paymentType = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20.h,
                        ),
                        height: 64.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: ConstColor.lightGrey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ConstColor.lightGrey,
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundColor: paymentType == index
                                    ? ConstColor.as_salomText
                                    : ConstColor.mainWhite,
                              ),
                            ),
                            ScreenUtil().setHorizontalSpacing(5.w),
                            SizedBox(
                              height: 32.h,
                              width: 85.w,
                              child: Image.asset(
                                "assets/images/click.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  "Комментарий к заказу (необязательно)",
                  style: Styles.style400sp14Black,
                ),
                InputWidget(
                  controller: commentController,
                  maxLines: 3,
                  hintText: 'Введите текст...',
                ),
                ScreenUtil().setVerticalSpacing(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
