import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/views/main_page/logic/payment_bloc/payment_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ChoosePaymentPage extends StatefulWidget {
  final int id;
  static const routeName = "/choosePaymentPage";

  const ChoosePaymentPage({super.key, required this.id});

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  @override
  void initState() {
    context.read<PaymentBloc>().add(PaymentOrder(id: widget.id));
    super.initState();
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
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        "Способ оплаты",
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: List.generate(
                        state.paymentTypesModel.data.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(state
                                      .paymentTypesModel.data[index].url
                                      .toString()),
                                  mode: LaunchMode.externalApplication);
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
                              child: SizedBox(
                                height: 32.h,
                                width: 85.w,
                                child: Image.network(
                                  state.paymentTypesModel.data[index].icon
                                      .toString(),
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
