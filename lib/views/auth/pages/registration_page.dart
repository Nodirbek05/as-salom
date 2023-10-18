import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pinput.dart';

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
  final focusNode = FocusNode();

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
        // height:96.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (phoneController.text.length < 12) {
                print("VALIDATION");
              } else {
                setState(() {
                  hasSms = true;
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 50.h,
              width: 328.w,
              decoration: BoxDecoration(
                  color: ConstColor.as_salomText,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Text(
                "Получить код",
                style: Styles.buttonText,
              ),
            ),
          ),
        ),
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
                    "Регистрация",
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
                            onCompleted: (pin) {},
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
                              // hintText: "Введите ваше имя",
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
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
