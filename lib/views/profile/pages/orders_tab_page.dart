import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/profile/data/logic/get_orders_bloc/get_orders_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    context.read<GetOrdersBloc>().add(GetOrdersData());
    super.initState();
  }

  int? openOrder;

  List<String> sizeData = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 15.w,
        right: 15.w,
      ),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: BlocBuilder<GetOrdersBloc, GetOrdersState>(
            builder: (context, state) {
              if (state is GetOrdersFail) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is GetOrdersSuccess) {
                final orders = state.orderModel.data;

                if (orders.isEmpty) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScreenUtil().setVerticalSpacing(170),
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/order_empty.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text(
                          "empty_order".tr(),
                          style: Styles.style600sp18Black,
                          textAlign: TextAlign.center,
                        ),
                        ScreenUtil().setVerticalSpacing(20),
                        Text(
                          "empty_order_info".tr(),
                          style: Styles.style400sp16Black,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    ...List.generate(
                      orders.length,
                      (index) => GestureDetector(
                        onTap: () {
                          openOrder = null;
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 15.h,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: ConstColor.dotColor),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: ConstColor.dotColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(20.r),
                                  ),
                                ),
                                child: Text(
                                  "${'order_no'.tr()}: ${orders[index].id}",
                                  style: Styles.style500sp14Black,
                                ),
                              ),
                              ScreenUtil().setVerticalSpacing(20),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "status".tr(),
                                      style: Styles.style500sp14Black,
                                    ),
                                    ScreenUtil().setHorizontalSpacing(5),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 25.h,
                                      width: 118.w,
                                      decoration: BoxDecoration(
                                        color: orders[index].status == "new"
                                            ? ConstColor.newStatus
                                            : orders[index].status == "delivery"
                                                ? ConstColor.assalomText
                                                : orders[index].status ==
                                                        "completed"
                                                    ? ConstColor.indigo
                                                    : orders[index].status ==
                                                            "waiting"
                                                        ? ConstColor.purpleDeep
                                                        : orders[index]
                                                                    .status ==
                                                                "block"
                                                            ? ConstColor
                                                                .redColor
                                                            : ConstColor
                                                                .newStatus,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Text(
                                        orders[index].status == "new"
                                            ? "new".tr()
                                            : orders[index].status == "delivery"
                                                ? "delivery".tr()
                                                : orders[index].status ==
                                                        "waiting"
                                                    ? "waiting".tr()
                                                    : orders[index].status ==
                                                            "completed"
                                                        ? "delivered".tr()
                                                        : orders[index]
                                                                    .status ==
                                                                "block"
                                                            ? "cancel".tr()
                                                            : "new".tr(),
                                        style: orders[index].status == "new"
                                            ? Styles.style500sp12Black
                                            : Styles.style500sp12White,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ScreenUtil().setVerticalSpacing(20),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                ),
                                child: Text(
                                    "${'confirmed_date'.tr()}:${DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(orders[index].createdat!).toLocal())}",
                                    style: Styles.style500sp14Black),
                              ),
                              openOrder != index
                                  ? ScreenUtil().setVerticalSpacing(20)
                                  : ScreenUtil().setVerticalSpacing(10),
                              openOrder != index
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left: 20.w,
                                      ),
                                      child: Text(
                                        "${'order_price'.tr()}: ${orders[index].totalprice}",
                                        style: Styles.style500sp14Black,
                                      ),
                                    )
                                  : const SizedBox(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      openOrder = index;

                                      setState(() {});
                                    },
                                    child: openOrder != index
                                        ? Container(
                                            margin: EdgeInsets.only(
                                              top: 8.h,
                                              bottom: 15.h,
                                            ),
                                            alignment: Alignment.center,
                                            height: 43.h,
                                            width: 296.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                color: ConstColor.assalomText,
                                              ),
                                            ),
                                            child: Text(
                                              "more".tr(),
                                              style: Styles.style700sp16Main,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              ),
                              openOrder == index
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left: 20.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Text(
                                              "F.I.O : ${orders[index].name}",
                                              style: Styles.style500sp14Black,
                                            ),
                                          ),
                                          ScreenUtil().setVerticalSpacing(5),
                                          Text(
                                            "${"${"payment_type".tr()}:" }${orders[index].paymenttype == "1" ? "Click" : orders[index].paymenttype == "2" ? "Payme" : orders[index].paymenttype == "3" ? "Uzum" : orders[index].paymenttype == "4" ? "Alif" : "Card"}",
                                            style: Styles.style500sp14Black,
                                          ),
                                          ScreenUtil().setVerticalSpacing(5),
                                          Text(
                                            "${'order_price'.tr()}:${orders[index].totalprice} ${"sum".tr()}",
                                            style: Styles.style700sp18Black,
                                          ),
                                          ScreenUtil().setVerticalSpacing(15),
                                          Text(
                                            "products".tr(),
                                            style: Styles.styles700sp20Black,
                                          ),
                                          ScreenUtil().setVerticalSpacing(5),
                                          ...List.generate(
                                              orders[index].products!.length,
                                              (idx) {
                                            sizeData.clear();
                                            for (var i = 0;
                                                i <
                                                    orders[index]
                                                        .products![idx]
                                                        .sizes!
                                                        .length;
                                                i++) {
                                              sizeData.add(orders[index]
                                                  .products![idx]
                                                  .sizes![i]
                                                  .sizenumber!
                                                  .toString());
                                            }
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 10.h,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 104.h,
                                                    width: 104.h,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            ApiPaths.imageUrl +
                                                                orders[index]
                                                                    .products![
                                                                        idx]
                                                                    .photo!),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                  ),
                                                  ScreenUtil()
                                                      .setHorizontalSpacing(10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 200.w,
                                                        child: Text(
                                                          "${orders[index].products![idx].nameru}",
                                                          style: Styles
                                                              .style500sp14Black,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      ScreenUtil()
                                                          .setVerticalSpacing(
                                                              5),
                                                      Text(
                                                          "${"size".tr()} ${sizeData.join(", ")}",
                                                          style: Styles
                                                              .style400sp12Black),
                                                      ScreenUtil()
                                                          .setVerticalSpacing(
                                                              5),
                                                      Text(
                                                        "${"volume".tr()}: ${orders[index].products![idx].productcount}",
                                                        style: Styles
                                                            .style400sp12Black,
                                                      ),
                                                      ScreenUtil()
                                                          .setVerticalSpacing(
                                                              5),
                                                      Text(
                                                        "${"price".tr()} ${orders[index].products![idx].productprice}",
                                                        style: Styles
                                                            .style400sp12Black,
                                                      ),
                                                      ScreenUtil()
                                                          .setVerticalSpacing(
                                                              20),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                          ScreenUtil().setVerticalSpacing(20),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
