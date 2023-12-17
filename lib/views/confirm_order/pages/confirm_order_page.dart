import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';

import 'package:assalomproject/views/confirm_order/logic/get_location_bloc/get_location_to_map_bloc.dart';
import 'package:assalomproject/views/confirm_order/pages/choose_payment_page.dart';
import 'package:assalomproject/views/confirm_order/pages/order_home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController roomNumberController = TextEditingController();

  List<String> list = ['One', 'Two', 'Three', 'Four'];

  String dropdownValue = "One";
  int? paymentType;
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool isHome = true;
  String favBox = "favoritesBoxForHome";
  String basketBox = "basketBoxForHome";
  void getCache() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    isHome = _prefs.getInt("place") == 2;
    favBox =
        _prefs.getInt('place') == 2 ? "favoritesBoxForHome" : "favoritesBox";
    basketBox = _prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";
    setState(() {});
  }

  @override
  void initState() {
    getCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products =
        Hive.box<BasketModel>(basketBox).values.toList().cast<BasketModel>();
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
            } else {
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
              "pay_for_order".tr(),
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
          "order_confirm".tr(),
          style: Styles.appBarText,
        ),
      ),
      body: BlocListener<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) {
          if (state is CreateOrderSuccess) {
            Navigator.pushNamed(context, ChoosePaymentPage.routeName,
                arguments: ChoosePaymentPage(
                    id: state.data.order.id!, name: nameController.text));
          }
        },
        child: isHome
            ? Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 15.w,
                  right: 15.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'fio'.tr(),
                            style: Styles.style400sp14Black,
                          ),
                          TextSpan(
                            text: '*',
                            style: Styles.style400sp14Red,
                          ),
                        ]),
                      ),
                      InputWidget(
                        validateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) return 'Enter valid name';
                          return null;
                        },
                        hintText: "enter_fio".tr(),
                        controller: nameController,
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Выберите зону",
                              style: Styles.style400sp14Black,
                            ),
                            TextSpan(
                              text: '*',
                              style: Styles.style400sp14Red,
                            ),
                          ],
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(5),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        height: 65.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: ConstColor.as_salomText,
                          ),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          elevation: 16,
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          style: Styles.style400sp14Black,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      Text(
                        "№ комнаты (необязательно)",
                        style: Styles.style400sp14Black,
                      ),

                      InputWidget(
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          phoneFormatter
                        ],
                        inputType: TextInputType.number,
                        controller: roomNumberController,
                      ),
                      // InputWidget(
                      //   validateMode: AutovalidateMode.onUserInteraction,

                      //   maxLength: 12,
                      //   inputFormatter: [
                      //     FilteringTextInputFormatter.digitsOnly,
                      //     phoneFormatter
                      //   ],
                      //   inputType: TextInputType.number,
                      //   prefixIcon: Text(
                      //     "+998 ",
                      //     style: Styles.style500sp16Black,
                      //   ),
                      //   controller: phoneController,
                      //   label: "phone_number".tr(),
                      //   // hintText: "Введите ваше Номер",
                      // ),
                      ScreenUtil().setVerticalSpacing(20),
                      Text(
                        "comments".tr(),
                        style: Styles.style400sp14Black,
                      ),
                      InputWidget(
                        controller: commentController,
                        maxLines: 3,
                        hintText: 'enter_text'.tr(),
                      ),
                      ScreenUtil().setVerticalSpacing(30)
                    ],
                  ),
                ),
              )
            : BlocProvider(
                create: (context) => GetLocationToMapBloc(),
                child: const OrderHomePage(),
              ),
      ),
    );
  }
}
