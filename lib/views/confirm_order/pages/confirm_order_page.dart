import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';
import 'package:assalomproject/views/confirm_order/pages/Choose_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConfirmOrderPage extends StatefulWidget {
  static const routeName = "/confirmOrder";
  const ConfirmOrderPage({
    super.key,
  });

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
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

            if (nameController.text.isEmpty || nameController.text.length < 4) {
              Fluttertoast.showToast(
                  msg: "Please fill your name",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  backgroundColor: ConstColor.as_salomText,
                  fontSize: 16.0);
            } else if (phoneController.text.isEmpty ||
                phoneController.text.length < 12) {
              Fluttertoast.showToast(
                  msg: "Please enter valuable number",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  backgroundColor: ConstColor.as_salomText,
                  fontSize: 16.0);
            } else{
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
            Navigator.pushNamed(context, ChoosePaymentPage.routeName,
                arguments: state.data.order.id);
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
                  validateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter valid name';
                  },
                  hintText: "Введите И.Ф.О",
                  controller: nameController,
                ),
                ScreenUtil().setVerticalSpacing(20),
                InputWidget(
                  validateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter valid number';
                  },
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
