import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/auth/data/logic/verification_bloc/verification_bloc.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/data/logic/update_name_bloc/update_name_bloc.dart';
import 'package:assalomproject/views/profile/data/models/model_for_update.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UpdateUserDataPage extends StatefulWidget {
  final ModelForUpdate data;
  static const routeName = "/updateUserData";
  const UpdateUserDataPage({super.key, required this.data});

  @override
  State<UpdateUserDataPage> createState() => _UpdateUserDataPageState();
}

class _UpdateUserDataPageState extends State<UpdateUserDataPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final focusNode = FocusNode();

  static Future<ResponseData> getCode() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var token = _prefs.getString('token');
      final response = await http
          .get(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getCode}'), headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json'
      });
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      bottomSheet: Container(
        height: 96.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ConstColor.mainWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: BlocListener<UpdateNameBloc, UpdateNameState>(
            listener: (context, state) {
              if (state is UpdateNameSuccess) {
                print("SUCCESFULL");
                Navigator.pushNamedAndRemoveUntil(
                    context, CustomNavigatonBar.routeName, (route) => false);
                context.read<GetUserProfileBloc>().add(GetProfileEvent());
              } else if (state is UpdateNumberSuccess) {
                getCode();
              }
            },
            child: InkWell(
              onTap: () {
                widget.data.part == "Имя"
                    ? context.read<UpdateNameBloc>().add(UpdateName(
                        name: controller.text, userId: widget.data.userId!))
                    : context.read<UpdateNameBloc>().add(UpdateNumber(
                        number: controller.text, userId: widget.data.userId!));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ConstColor.as_salomText,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "save".tr(),
                  style: Styles.buttonText,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.data.part == "Имя" ? "edit_name".tr() : "edit_number".tr(),
          style: Styles.style600sp18Black,
        ),
        backgroundColor: ConstColor.mainWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<UpdateNameBloc, UpdateNameState>(
          builder: (context, state) {
            if (state is UpdateNumberSuccess) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Код отправлен на номер\n +998 ${controller.text}',
                      style: Styles.styles400sp16Black,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    BlocListener<VerificationBloc, VerificationState>(
                      listener: (context, state) {
                        if (state is VerificationSuccess) {
                          print("SUCCESFULL");
                          Navigator.pop(context);
                          context
                              .read<GetUserProfileBloc>()
                              .add(GetProfileEvent());
                        }
                      },
                      child: Pinput(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        length: 4,
                        controller: pinController,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          context
                              .read<VerificationBloc>()
                              .add(VerificationDataEvent(
                                code: num.parse(pin),
                              ));
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Отправить код заново",
                      style: Styles.style400sp16Main,
                    )
                  ],
                ),
              );
            }
            return Column(
              children: [
                widget.data.part == "Имя"
                    ? InputWidget(
                        hintText: widget.data.name,
                        label: widget.data.part,
                        controller: controller,
                      )
                    : InputWidget(
                        hintText: widget.data.phone.toString().substring(5, 17),
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
                        controller: controller,
                        label: "phone_number".tr(),
                        // hintText: "Введите ваше Номер",
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
