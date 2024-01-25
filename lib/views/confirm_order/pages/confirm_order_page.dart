import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/zone_models.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';

import 'package:assalomproject/views/confirm_order/logic/get_location_bloc/get_location_to_map_bloc.dart';
import 'package:assalomproject/views/confirm_order/logic/get_zone_bloc/get_zone_bloc.dart';
import 'package:assalomproject/views/confirm_order/pages/choose_payment_page.dart';
import 'package:assalomproject/views/confirm_order/pages/order_home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

  String? dropdownValue;
  int? paymentType;
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late bool isHome;
  String favBox = "favoritesBoxForHome";
  String basketBox = "basketBoxForHome";
  void getCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isHome = prefs.getInt("place") == 2;
    // print(prefs.getInt('place'));
    favBox =
        prefs.getInt('place') == 2 ? "favoritesBoxForHome" : "favoritesBox";
    basketBox = prefs.getInt('place') == 2 ? "basketBoxForHome" : "basketBox";
    setState(() {});
  }

  @override
  void initState() {
    getCache();
    context.read<GetZoneBloc>().add(GetZoneData());
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
            if (OrderHomePage.nameController.text.isEmpty &&
                nameController.text.isEmpty) {
              Fluttertoast.showToast(
                  msg: "correct_name".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  backgroundColor: ConstColor.assalomText,
                  fontSize: 16.0);
            } else if (isHome
                ? false
                : (dropdownValue == null || dropdownValue!.isEmpty)) {
              Fluttertoast.showToast(
                  msg: "choose_zone".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  backgroundColor: ConstColor.assalomText,
                  fontSize: 16.0);
            } else {
              // print(dropdownValue);
              context.read<CreateOrderBloc>().add(
                    Makeorder(
                      good: CreateOrderModel(
                        desc: commentController.text,
                        name: nameController.text.isNotEmpty
                            ? nameController.text
                            : OrderHomePage.nameController.text,
                        phone: phoneController.text,
                        goods: goods,
                        placeType: isHome ? 2 : 1,
                        roomNumber: isHome
                            ? null
                            : roomNumberController.text.isNotEmpty
                                ? int.parse(roomNumberController.text)
                                : null,
                        zoneName: isHome ? null : dropdownValue,
                        apartment: isHome
                            ? OrderHomePage.kvController.text.isNotEmpty
                                ? int.parse(OrderHomePage.kvController.text)
                                : null
                            : null,
                        enterance: isHome
                            ? OrderHomePage.podezdController.text.isNotEmpty
                                ? int.parse(OrderHomePage.podezdController.text)
                                : null
                            : null,
                        floor: isHome
                            ? OrderHomePage.etajController.text.isNotEmpty
                                ? int.parse(OrderHomePage.etajController.text)
                                : null
                            : null,
                        homeNumber: isHome
                            ? OrderHomePage.homeController.text.isNotEmpty
                                ? int.tryParse(
                                    OrderHomePage.homeController.text)
                                : null
                            : null,
                        lat: isHome
                            ? OrderHomePage.position.latitude.toString()
                            : null,
                        lng: isHome
                            ? OrderHomePage.position.longitude.toString()
                            : null,
                      ),
                    ),
                  );

              OrderHomePage.nameController.clear();
              OrderHomePage.commentController.clear();
              OrderHomePage.adressController.clear();
              OrderHomePage.homeController.clear();
              OrderHomePage.kvController.clear();
              OrderHomePage.etajController.clear();
              OrderHomePage.podezdController.clear();
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 35.h,
            width: 328.w,
            decoration: BoxDecoration(
                color: ConstColor.assalomText,
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
        child: !isHome
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
                      SizedBox(
                        height: 55.h,
                        child: InputWidget(
                          padding: EdgeInsets.only(
                            top: 4.h,
                            left: 15.h,
                          ),
                          // validateMode: AutovalidateMode.onUserInteraction,
                          // validator: (val) {
                          //   if (val!.isEmpty) return 'Enter valid name';
                          //   return null;
                          // },
                          hintText: "enter_fio".tr(),
                          hintStyle: Styles.style400sp16Black,
                          controller: nameController,
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "zone".tr(),
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
                      BlocBuilder<GetZoneBloc, GetZoneState>(
                        builder: (context, state) {
                          if (state is GetZoneInitial) {
                            return const Center(
                                child: CupertinoActivityIndicator());
                          } else if (state is GetZoneSuccess) {
                            // String dropdownValue =
                            //     state.zoneModels.data.first.toString();
                            return SizedBox(
                                height: 50.h,
                                child: sizeDropDown(state.zoneModels.data));
                          }
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        },
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      Text(
                        "room_no".tr(),
                        style: Styles.style400sp16Black,
                      ),

                      SizedBox(
                        height: 50.h,
                        child: InputWidget(
                          padding: EdgeInsets.only(
                            top: 4.h,
                            left: 15.h,
                          ),
                          // inputFormatter: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   phoneFormatter
                          // ],
                          inputType: TextInputType.number,
                          controller: roomNumberController,
                        ),
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
                        hintStyle: Styles.style400sp16Black,
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

  Widget sizeDropDown(List<ZoneData> data) {
    return DropdownButtonFormField2<String>(
      value: dropdownValue,
      // isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          bottom: 10.h,
        ),
        // contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ConstColor.assalomText),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ConstColor.assalomText),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ConstColor.assalomText),
        ),
      ),

      hint: Text(
        'Выберите зону доставки',
        style: Styles.style400sp16Black,
      ),
      items: data
          .map(
            (item) => DropdownMenuItem<String>(
              value: item.nameru,
              child: Text(
                item.nameru.toString(),
                style: Styles.style400sp16Black,
              ),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Выберите зону доставки';
        }
        return null;
      },
      onChanged: (value) {
        dropdownValue = value;
        setState(() {});
        // print(value);
      },
      onSaved: (value) {
        dropdownValue = value;
      },
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: ConstColor.assalomText,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: ConstColor.assalomText,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.clear();
    commentController.clear();
    phoneController.clear();
    roomNumberController.clear();
    dropdownValue = null;

    super.dispose();
  }
}
