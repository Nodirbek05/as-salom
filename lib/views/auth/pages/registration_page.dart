import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/auth/data/logic/login_bloc/login_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/registration_bloc/register_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/verification_bloc/verification_bloc.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = "/authPage";

  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  bool isLogin = false;
  bool hasSms = false;
  bool isLoading = false;
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
        padding: EdgeInsets.only(
          bottom: 15.h,
        ),
        height:80.h,
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
            padding: const EdgeInsets.all(8.0),
            child: hasSms
                ? BlocListener<VerificationBloc, VerificationState>(
                    listener: (context, state) {
                      if (state is VerificationSuccess) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            CustomNavigatonBar.routeName, (route) => false);
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        if (pinController.text.length < 4) {
                          print("VALIDATION");
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          context
                              .read<VerificationBloc>()
                              .add(VerificationDataEvent(
                                code: num.parse(pinController.text),
                              ));
                        }
                        // Navigator.pushNamed(context, MainPage.routeName);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 328.w,
                        decoration: BoxDecoration(
                            color: ConstColor.as_salomText,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: isLoading
                            ? const CupertinoActivityIndicator(
                                color: ConstColor.mainWhite,
                              )
                            : Text(
                                isLogin ? "Войти" : "Зарегистрироваться",
                                style: Styles.buttonText,
                              ),
                      ),
                    ),
                  )
                : !isLogin
                    ? BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterSuccess) {
                            getCode();
                            setState(() {
                              hasSms = true;
                              isLoading = false;
                            });
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            if (phoneController.text.length < 12) {
                              print("VALIDATION");
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              context.read<RegisterBloc>().add(
                                  RegisterDataEvent(
                                      name: controller.text,
                                      phone: phoneController.text,
                                      deviceName: "Test"));
                            }
                            // Navigator.pushNamed(context, MainPage.routeName);
                            // Navigator.pushNamedAndRemoveUntil(context,
                            // CustomNavigatonBar.routeName, (route) => false);
                            // Navigator.pushNamedAndRemoveUntil(context,
                            //     CustomNavigatonBar.routeName, (route) => false);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 328.w,
                            decoration: BoxDecoration(
                                color: ConstColor.as_salomText,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: isLoading
                                ? const CupertinoActivityIndicator(
                                    color: ConstColor.mainWhite,
                                  )
                                : Text(
                                    "Получить код",
                                    style: Styles.buttonText,
                                  ),
                          ),
                        ),
                      )
                    : BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            print("LOGIN SUCCES");
                            getCode();
                            setState(() {
                              hasSms = true;
                              isLoading = false;
                            });
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            if (phoneController.text.length < 12) {
                              print("VALIDATION");
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              context.read<LoginBloc>().add(LoginDataEvent(
                                    phone: phoneController.text,
                                  ));
                            }
                            // Navigator.pushNamed(context, MainPage.routeName);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 328.w,
                            decoration: BoxDecoration(
                                color: ConstColor.as_salomText,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: isLoading
                                ? const CupertinoActivityIndicator(
                                    color: ConstColor.mainWhite,
                                  )
                                : Text(
                                    "Получить код",
                                    style: Styles.buttonText,
                                  ),
                          ),
                        ),
                      )),
      ),
      appBar: AppBar(
        backgroundColor: ConstColor.mainWhite,
        iconTheme: const IconThemeData(color: ConstColor.mainBlack),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    hasSms
                        ? {
                            print("can't"),
                          }
                        : {
                            setState(() {
                              isLogin = false;
                            }),
                          };
                  },
                  child: Text(
                    tr('registration'),
                    style: isLogin ? Styles.greyRegister : Styles.registerText,
                  ),
                ),
                Container(
                  height: 19.h,
                  width: 2.w,
                  color: ConstColor.mainBlack,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    hasSms
                        ? {
                            print("can't"),
                          }
                        : {
                            setState(() {
                              isLogin = true;
                            })
                          };
                  },
                  child: Text(
                    "Вход в аккаунт",
                    style: isLogin ? Styles.registerText : Styles.greyRegister,
                  ),
                ),
              ],
            ),
            hasSms
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Код отправлен на номер\n +998 ${phoneController.text}',
                            style: Styles.styles400sp16Black,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Pinput(
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
                            separatorBuilder: (index) =>
                                const SizedBox(width: 8),
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
                          const SizedBox(height: 20),
                          Text(
                            "Отправить код заново",
                            style: Styles.style400sp16Main,
                          )
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      isLogin
                          ? const Center()
                          : ScreenUtil().setVerticalSpacing(20),
                      isLogin
                          ? const Center()
                          : InputWidget(
                              controller: controller,
                              label: "Ваше имя",
                              hintText: "Введите ваше имя",
                              padding:const EdgeInsets.only(
                                bottom: 30,
                                left:10,
                              ),
                            ),
                      ScreenUtil().setVerticalSpacing(20),
                      InputWidget(
                        padding: const EdgeInsets.only(
                                bottom: 30,
                                left:10,
                              ),
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
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
