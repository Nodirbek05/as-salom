import 'dart:async';

import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/initail/pages/choose_language_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 1, milliseconds: 300),
      () {
        Navigator.pushNamed(context, LanguagePage.routeName);

        super.initState();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xff12D6CA),
                  Color(0xff49EEAC),
                ],
              ),
            ),
            child: Center(
              child: Text(
                "as-salom",
                style: Styles.tooBoldtext60,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 50,
            child: SvgPicture.asset(
              ConstIcons.a,
            ),
          ),
        ],
      ),
    );
  }
}
