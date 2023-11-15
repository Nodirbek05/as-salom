import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_animation_page.dart';
import 'package:assalomproject/views/main_page/logic/payment_bloc/payment_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

class ChoosePaymentPage extends StatefulWidget {
  final int id;
  static const routeName = "/choosePaymentPage";

  const ChoosePaymentPage({super.key, required this.id});

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    context.read<PaymentBloc>().add(PaymentOrder(id: widget.id));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("LIFECYCLE WORKED OR NOPE");
    print(state.toString());
    if (state == AppLifecycleState.resumed) {
      print("resumed");
      Navigator.pushNamed(context, ConfirmAnimationPage.routeName);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentInitial) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is PaymentSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Способ оплаты",
                        style: Styles.style400sp14Black,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: List.generate(
                        state.paymentTypesModel.data.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.h,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.r),
                              onTap: () {
                                launchUrl(
                                    Uri.parse(state
                                        .paymentTypesModel.data[index].url
                                        .toString()),
                                    mode: LaunchMode.externalApplication);
                                Hive.box<BasketModel>('basketBox').clear();
                              },
                              child: Container(
                                // padding: EdgeInsets.only(
                                //   bottom: 20.h,
                                // ),
                                height: 64.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: ConstColor.lightGrey,
                                  ),
                                ),
                                child: SizedBox(
                                  height: 32.h,
                                  width: 85.w,
                                  child: Image.network(
                                    state.paymentTypesModel.data[index].icon
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        },
      ),
    );
  }
}
